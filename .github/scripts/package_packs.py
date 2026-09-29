"""Package the released datapacks and inspect the result.

Usage: python .github/scripts/package_packs.py --output dist [--tag v1.0.0]

Writes one ZIP per pack from the files tracked in this repository. Each ZIP
holds only what Minecraft loads plus the license documents, with pack.mcmeta
at its root. Pass --tag to name the ZIPs for a release and require every pack
version to match it.
"""
import argparse
import hashlib
import json
import subprocess
import sys
from pathlib import Path
from zipfile import ZIP_DEFLATED, ZipFile

ROOT = Path(__file__).resolve().parents[2]

# Released pack -> a path that must be present in its ZIP.
PACKS = {
    "zombies_build_kit": "data/zbk/function/load.mcfunction",
    "zbk_template": "data/zbk_template/",
}
ROOT_FILES = {"pack.mcmeta", "pack.png", "VERSION"}
DATA_TYPES = {".mcfunction", ".json", ".nbt"}
LICENSE_DOCUMENTS = {
    "LICENSES/LICENSE.md",
    "LICENSES/NOTICE",
    "LICENSES/MEDIA_PERMISSION.md",
    "LICENSES/CC-BY-NC-4.0.txt",
    "LICENSES/PolyForm-Noncommercial-1.0.0.txt",
}
LOCAL_ONLY = {"AGENTS.md", "AGENTS.override.md", "CLAUDE.md", "GEMINI.md", ".codex", ".claude", ".agents"}


def tracked_files(pack):
    listing = subprocess.run(
        ["git", "ls-files", "-z", "--", pack], cwd=ROOT, check=True, capture_output=True
    ).stdout.decode("utf-8")
    return sorted(name for name in listing.split("\0") if name)


def belongs(relative):
    top = relative.parts[0]
    if top == "data":
        return relative.suffix in DATA_TYPES
    if top == "LICENSES":
        return True
    return relative.as_posix() in ROOT_FILES


def read_version(pack):
    version = (ROOT / pack / "VERSION").read_text(encoding="utf-8").strip()
    metadata = json.loads((ROOT / pack / "pack.mcmeta").read_text(encoding="utf-8"))
    if metadata["zbk"]["version"] != version:
        raise SystemExit(f"{pack}: pack.mcmeta version does not match VERSION")
    return version


def package(pack, archive_path):
    with ZipFile(archive_path, "w", ZIP_DEFLATED) as archive:
        for name in tracked_files(pack):
            relative = Path(name).relative_to(pack)
            if belongs(relative):
                archive.write(ROOT / name, relative.as_posix())


def inspect(pack, archive_path, version):
    with ZipFile(archive_path) as archive:
        if archive.testzip() is not None:
            raise SystemExit(f"{archive_path.name} is damaged")
        names = set(archive.namelist())
        packaged_version = archive.read("VERSION").decode("utf-8").strip() if "VERSION" in names else None

    if "pack.mcmeta" not in names or packaged_version != version:
        raise SystemExit(f"{archive_path.name} has no matching pack metadata at its root")
    required = PACKS[pack]
    if not any(name == required or name.startswith(required) for name in names):
        raise SystemExit(f"{archive_path.name} is missing {required}")
    missing = LICENSE_DOCUMENTS - names
    if missing:
        raise SystemExit(f"{archive_path.name} is missing {sorted(missing)}")
    unexpected = [name for name in names if not belongs(Path(name)) or LOCAL_ONLY & set(Path(name).parts)]
    if unexpected:
        raise SystemExit(f"{archive_path.name} contains unexpected files: {sorted(unexpected)[:5]}")
    return len(names)


def main():
    parser = argparse.ArgumentParser(description="Package the released datapacks.")
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--tag", help="Release tag, such as v1.0.0")
    args = parser.parse_args()

    args.output.mkdir(parents=True, exist_ok=True)
    for pack in PACKS:
        version = read_version(pack)
        if args.tag and args.tag != f"v{version}":
            raise SystemExit(f"{pack} is version {version}, which does not match {args.tag}")
        archive_path = args.output / (f"{pack}-{args.tag}.zip" if args.tag else f"{pack}.zip")
        package(pack, archive_path)
        count = inspect(pack, archive_path, version)
        digest = hashlib.sha256(archive_path.read_bytes()).hexdigest()
        print(f"{digest}  {archive_path.name}  ({count} files, version {version})")


if __name__ == "__main__":
    sys.exit(main())
