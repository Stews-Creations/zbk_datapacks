"""Check bundled Core templates and literal placement references without dependencies."""
import gzip
import re
from pathlib import Path

PACK = Path(__file__).resolve().parents[1] / "zombies_build_kit"


def validate() -> None:
    templates = {}
    for namespace in (PACK / "data").iterdir():
        for path in (namespace / "structure").rglob("*.nbt"):
            relative = path.relative_to(namespace / "structure")
            if namespace.name != "zbk" or len(relative.parts) < 2:
                raise ValueError(f"Core templates require data/zbk/structure/<category>/: {path}")
            name = namespace.name + ":" + path.relative_to(namespace / "structure").with_suffix("").as_posix()
            # Structure files are compressed NBT compounds; full NBT and command
            # behavior are checked by loading the packaged templates in Minecraft.
            if not gzip.decompress(path.read_bytes()).startswith(b"\x0a"):
                raise ValueError(f"Invalid NBT compound: {path}")
            templates[name] = path
    if not templates:
        raise ValueError("Core has no bundled structure templates")
    references = set()
    for path in (PACK / "data").rglob("*.mcfunction"):
        for name in re.findall(r"\bplace template (\S+)", path.read_text(encoding="utf-8-sig")):
            if "$" in name:
                continue  # Macro-generated references require runtime validation.
            references.add(name)
            if name not in templates:
                raise ValueError(f"{path.relative_to(PACK)}: missing bundled template {name}")
    print(f"Passed: {len(templates)} bundled NBT templates, {len(references)} placement references.")


if __name__ == "__main__":
    validate()
