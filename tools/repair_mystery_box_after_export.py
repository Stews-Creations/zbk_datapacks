"""Apply the teddy and box-close gameplay callback contracts after a BDEngine export.

Preserves generated transforms and playback. Use --check to verify without edits.
"""
import argparse
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
KEYFRAMES = ROOT / "zombies_build_kit/data/mystery_box/function/k"
OBSOLETE = "function zombies:map_elements/mystery_box/location_manager/select_new_location"
COMPLETE = "function zombies:map_elements/mystery_box/teddy_bear/teddy_bear_complete"
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("--check", action="store_true")
args = parser.parse_args()
errors = []
for facing in ("north", "south", "east", "west"):
    path = KEYFRAMES / f"box_close_{facing}" / "keyframe_5.mcfunction"
    text = path.read_text(encoding="utf-8")
    start = text.find("# Mark box as ready")
    end = text.find(f"tag @s remove anim_box_close_{facing}")
    callback = "execute at @s as @e[type=marker,tag=mystery_box_location,distance=..5,limit=1,sort=nearest] run function zombies:map_elements/mystery_box/animation/state/close_complete\n\n"
    updated = text if start == -1 else text[:start] + "# Complete only this root's location. Gameplay is owned by zombies.\n" + callback + text[end:]
    if callback.strip() not in updated or end == -1:
        raise ValueError(f"Missing close callback boundary: {path}")
    if updated != text:
        if args.check:
            errors.append(str(path.relative_to(ROOT)))
        else:
            path.write_text(updated, encoding="utf-8", newline="\n")
    folder = KEYFRAMES / f"teddy_bear_{facing}"
    for frame in (131, 150):
        path = folder / f"keyframe_{frame}.mcfunction"
        text = path.read_text(encoding="utf-8")
        # Gameplay belongs at completion only. Frame 131 keeps its visual effects.
        updated = text.replace("# Move box to new location\n" + OBSOLETE + "\n\n", "")
        updated = updated.replace(OBSOLETE + "\n", "")
        if frame == 150 and COMPLETE not in updated.splitlines():
            updated = updated.rstrip() + "\n# Teddy bear animation complete - handle cleanup and location change\n" + COMPLETE + "\n"
        if updated.splitlines().count(COMPLETE) != (1 if frame == 150 else 0):
            raise ValueError(f"Unexpected completion callback count: {path}")
        if updated != text:
            if args.check:
                errors.append(str(path.relative_to(ROOT)))
            else:
                path.write_text(updated, encoding="utf-8", newline="\n")
if errors:
    raise SystemExit("Mystery Box callback repair required:\n" + "\n".join(errors))
print("PASS: teddy and box-close callbacks are scoped to completion in all directions.")
