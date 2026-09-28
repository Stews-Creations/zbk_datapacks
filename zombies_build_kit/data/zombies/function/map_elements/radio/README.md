# Radio

Provides a reusable radio prop with a persistent `radio_marker`, a derived display assembly, and an interaction. The marker is used by Build Kit targeting and remains the source of truth for the prop.

`on_load` creates the placement trigger and calls `initialize`. Initialization applies the display range to loaded radios and their passengers; newly placed assemblies receive the same setting. The radio uses the shared `zombies:game.disco` sound event, so playback does not depend on a selected map or sound pack.
