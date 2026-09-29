# Mystery Box

Reusable boxes reconstruct runtime displays and interactions from persistent `mystery_box_location` markers. `on_load` defines objectives; `initialize` rebuilds placed boxes. Buy/claim ownership stays attached to the purchasing player's ID.

Teddy bear relocation runs once, when the animation completes at keyframe 150. The earlier poof at keyframe 131 only plays effects. Completion deactivates the old marker, queues its empty animation, and selects the new active location. Outside Fire Sale, only that active location accepts purchases. A Fire Sale that starts during the teddy animation may temporarily reopen the old location; it becomes unavailable again when Fire Sale ends.

Closing a temporary Fire Sale box keeps it ready while the sale remains active. Only an expired sale queues removal for an inactive location. Each animation completion updates its own location through `animation/state/close_complete`; it does not update other roots that are still closing.

## Location effect dispatch

`animation/tick_location_effects` emits the existing box particles and conditional beam from one selected location. Gun spinning, model animation, pending empty/spawn actions, Fire Sale, and location ownership remain in their original phases. The helper stores no marker list and requires no extra reset.

## Animation entry points

Gameplay uses the directional buy, close, spawn, empty, and teddy-bear animation wrappers. The unused undirected box-open wrapper was removed because its generated animation no longer exists. Generated playback remains under the `mystery_box` namespace; gameplay state transitions stay in this module.

## Display range

`display/configure_rendering` sets item-display passengers of the generated box carriers to `view_range:0.35f`. All four directional spawn wrappers apply it after creation, and `initialize` reapplies it to loaded boxes on reload or reset. The effective distance depends on the client entity-distance settings; 0.35 is a range multiplier, not a distance in blocks. Price and claim text passengers use `view_range:0.5f`. `display/restore_text_rendering` enforces that label range each tick, so existing boxes saved with zero range recover when their chunks load. Generated transforms still hide labels during inactive and spinning stages; block displays retain their own ranges. Generated animation files remain unchanged.

## Responsibility folders

Weapon selection, display, inventory delivery, and cycling live in matching subfolders of `guns/`. Location indexing, selection, and lifecycle live under `locations/`. The module's `build_kit/` folder owns marker configuration, deletion, and Build Manager dispatch.
