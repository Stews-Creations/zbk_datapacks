"""Build versioned datapack ZIPs from explicit runtime inputs."""
import argparse
from pathlib import Path
from zipfile import ZIP_DEFLATED, ZipFile

ROOT = Path(__file__).resolve().parents[1]
PACK_NAMES = ("zombies_build_kit", "zbk_nacht_der_untoten", "zbk_der_eisendrache", "zbk_template")

def package(name):
    pack = ROOT / name
    if not (pack / "pack.mcmeta").is_file():
        raise FileNotFoundError(pack / "pack.mcmeta")
    output = ROOT / "output" / f"{name}.zip"
    output.parent.mkdir(exist_ok=True)
    with ZipFile(output, "w", ZIP_DEFLATED) as archive:
        for path in sorted(pack.rglob("*")):
            if not path.is_file():
                continue
            relative = path.relative_to(pack)
            if any(part.startswith(".") for part in relative.parts):
                continue
            if relative.parts[0] == "data":
                if path.suffix not in {".mcfunction", ".json", ".nbt"}:
                    continue
            elif relative.parts[0] != "LICENSES" and relative.as_posix() not in {
                "pack.mcmeta", "pack.png", "VERSION"
            }:
                continue
            archive.write(path, relative.as_posix())
    print(output)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--pack", choices=PACK_NAMES + ("all",), default="zombies_build_kit")
    args = parser.parse_args()
    for name in PACK_NAMES if args.pack == "all" else (args.pack,):
        package(name)
