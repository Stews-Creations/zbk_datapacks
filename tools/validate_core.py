"""Validate Core alone or a Core/add-on combination without modifying a world."""
import argparse
from pathlib import Path
import json
import re
import sys

from mecha import Mecha

ROOT = Path(__file__).resolve().parents[1]
PACK = ROOT / "zombies_build_kit"
cli = argparse.ArgumentParser(description=__doc__)
cli.add_argument("--map", choices=("zbk_template", "zbk_nacht_der_untoten", "zbk_der_eisendrache"))
cli.add_argument("--references-only", action="store_true", help="Skip Mecha for a quick dependency check.")
args = cli.parse_args()
PACKS = [PACK] + ([ROOT / args.map] if args.map else [])
ERRORS = []


def reference(value, owner, kind="function"):
    if "$" in value:
        return  # Macro-generated paths are exercised by runtime checks.
    tag = value.startswith("#")
    value = value.lstrip("#")
    namespace, path = value.split(":", 1) if ":" in value else ("minecraft", value)
    if namespace == "minecraft" and kind != "function":
        return
    folder = "tags/" + kind if tag else kind
    suffix = ".mcfunction" if kind == "function" and not tag else ".json"
    if not any((pack / "data" / namespace / folder / (path + suffix)).is_file() for pack in PACKS):
        ERRORS.append(f"{owner}: missing {kind} {value}")


parser = Mecha(version="1.21")
# Official 26.2 server command report supplies the renamed gamerules.
parser.spec.add_commands(json.loads((ROOT / "tools/gamerules-26.2.json").read_text()))
parser.spec.add_commands(json.loads((ROOT / "tools/stopwatch-26.2.json").read_text()))
count = 0
for path in (path for pack in PACKS for path in pack.rglob("*")):
    if path.suffix not in {".mcfunction", ".json", ".mcmeta"}:
        continue
    text = path.read_text(encoding="utf-8-sig")
    owner = path.relative_to(ROOT)
    if path.suffix == ".mcfunction":
        count += 1
        try:
            if not args.references_only:
                parser.parse(text)
        except Exception as error:
            ERRORS.append(f"{owner}: {error}")
    else:
        try:
            data = json.loads(text)
        except ValueError as error:
            ERRORS.append(f"{owner}: {error}")
            continue
        if "/advancement/" in path.as_posix():
            reward = data.get("rewards", {}).get("function")
            if reward:
                reference(reward, owner)
        if "/tags/function/" in path.as_posix():
            for value in data.get("values", []):
                if isinstance(value, dict):
                    if not value.get("required", True):
                        continue
                    value = value["id"]
                reference(value, owner)
        if "/dialog/" in path.as_posix():
            def dialogs(node):
                if isinstance(node, dict):
                    target = node.get("dialog")
                    if isinstance(target, str):
                        reference(target, owner, "dialog")
                    for value in node.values():
                        dialogs(value)
                elif isinstance(node, list):
                    for value in node:
                        dialogs(value)
            dialogs(data)
    for value in re.findall(r"\bfunction\s+(#?[a-z0-9_]+:[a-z0-9_./$()-]+)", text):
        reference(value, owner)
    for value in re.findall(r"\badvancement (?:grant|revoke) \S+ only ([a-z0-9_]+:[a-z0-9_./$()-]+)", text):
        reference(value, owner, "advancement")
    for value in re.findall(r"\b(?:if|unless) predicate ([a-z0-9_]+:[a-z0-9_./$()-]+)", text):
        reference(value, owner, "predicate")
    for value in re.findall(r"\bdialog show \S+ ([a-z0-9_]+:[a-z0-9_./$()-]+)", text):
        reference(value, owner, "dialog")
    for value in re.findall(r"\b(?:if|unless) block \S+ \S+ \S+ (#[a-z0-9_]+:[a-z0-9_./$()-]+)", text):
        reference(value, owner, "block")
    for component in re.findall(r'enchantments[=:\s"\\]+\{([^}]+)', text.replace('\\"', '"')):
        for value in re.findall(r'"([a-z0-9_]+:[a-z0-9_./-]+)"\s*:', component):
            reference(value, owner, "enchantment")
    if re.search(r"zombies:maps/|zbk_map_|map_sound_id|\$\(map_id\)", text):
        if path.is_relative_to(PACK) or re.search(r"zombies:maps/|zbk_map_|map_sound_id|\$\(map_id\)", text):
            ERRORS.append(f"{owner}: obsolete map dependency remains")
    if path.is_relative_to(PACK) and re.search(r"zbk_(?:nacht_der_untoten|der_eisendrache|template):", text):
        ERRORS.append(f"{owner}: Core must not reference an add-on namespace")
    if not path.is_relative_to(PACK) and re.search(r"\bfunction\s+zombies:", text):
        ERRORS.append(f"{owner}: add-on calls a private Core function")

for path in [ROOT / "README.md"] + [path for pack in PACKS for path in pack.rglob("README.md")]:
    if any(part.startswith(".") for part in path.relative_to(ROOT).parts):
        continue
    text = path.read_text(encoding="utf-8-sig")
    if len(re.findall(r"^# ", text, re.M)) != 1 or len(re.findall(r"^```", text, re.M)) % 2:
        ERRORS.append(f"{path.relative_to(ROOT)}: invalid heading/fences")
    for target in re.findall(r"\[[^\]]*\]\(([^)]+)\)", text):
        if "://" in target or target.startswith("#"):
            continue
        if not (path.parent / target.split("#")[0]).exists():
            ERRORS.append(f"{path.relative_to(ROOT)}: broken link {target}")
    for value in re.findall(r"\bfunction ((?:zombies|zbk|zbk_template|zbk_nacht_der_untoten|zbk_der_eisendrache):[a-z0-9_/.-]+)", text):
        reference(value, path.relative_to(ROOT))

if ERRORS:
    print("\n".join(ERRORS))
    sys.exit(1)
print(f"Passed: {count} functions, JSON, static references, and README links ({', '.join(p.name for p in PACKS)}).")
