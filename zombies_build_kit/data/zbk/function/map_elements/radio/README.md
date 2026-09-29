# Radio

Provides a reusable radio prop with a persistent `radio_marker`, a derived display assembly, and an interaction. The marker is used by Build Kit targeting and remains the source of truth for the prop.

`on_load` creates the placement trigger and calls `initialize`. Initialization applies the display range to loaded radios and their passengers; newly placed assemblies receive the same setting. The radio uses the shared `zbk:radio` sound event with all ten shared radio tracks, so playback does not depend on a selected map or sound pack.

Shoot the radio to play music; punch or knife it to stop playback. Each melee hit is consumed before dispatching the map's sound override, so it cannot keep stopping subsequent tracks. Sound overrides must stop the same sound ID and channel they play.

## Authoring ownership

Feature-specific editor functions and Build Manager handlers live inside the owning gameplay feature's `build_kit/` folder. The shared Build Manager only owns tool input, pending selection, and routing; each feature preserves its own dialog context and cleanup order.
