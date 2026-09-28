# Mystery Box Animation Namespace

Contains generated animation functions for the Mystery Box model in the `mystery_box` namespace.

## Layout

| Path | Generated content |
| --- | --- |
| `function/a/` | Animation entry points and playback loops |
| `function/k/` | Keyframes, pause checks, and animation loop checks |
| `function/effects/` | Animation-owned smoke, beam, particle, and lightning effects |
| `function/_/` | Generated create, delete, and stop helpers |
| `function/check_pause*` | Shared generated pause dispatch |

Directional animations are generated for east, north, south, and west variants. Current animation groups include buy, spawn, empty, teddy bear, and box close.

## Ownership

Gameplay state, purchases, gun selection, location management, and validation belong to `zbk:map_elements/mystery_box`. This namespace only owns generated model animation playback.

## Editing Rules

- Do not hand-edit generated keyframes or pause checks.
- Put custom gameplay logic in the `zbk` namespace.
- Re-export the animation source when generated playback needs to change.
- After regeneration, verify that gameplay trigger functions still call valid animation entry points.

After a BDEngine export, restore the teddy and box-close gameplay callback contracts without changing generated transforms or playback. Keyframe 131 retains the poof effects; only keyframe 150 calls `teddy_bear_complete` in the owning gameplay module. Calling relocation at both frames leaves multiple active boxes. Verify the hooks and test animation completion in an isolated Minecraft 26.2 world. Box-close keyframe 5 calls the owning location completion helper once, so active Fire Sales keep temporary boxes ready and simultaneous boxes do not update each other. The checked-in generated animation files are the available animation source; preserve these gameplay callbacks after regeneration.
