# Der Eisendrache sound routing

This module owns DE-specific audio requests, character voice selection and cooldowns, and ambient music timing. Core owns provider selection and dispatches the shared `sound_*` and `voice_event_*` tags; this module plays only DE resource-pack event IDs.

| Entry point | Responsibility |
| --- | --- |
| `on_load.mcfunction` | Defines voice-slot scores and ambient timer state. |
| `request/` | Handles Core sound requests and blocks generic fallback only when DE supplies the cue. |
| `voice/` | Selects character-specific lines, applies per-character cooldowns, and checks per-player voice triggers. |
| `music/on_tick_1s.mcfunction` | Advances the ambient timer while a game is active. |
| `music/stop_ambient.mcfunction` | Stops map music and clears the ambient timer during reset or game end. |

The map lifecycle calls voice cooldown maintenance once per tick, per-player voice checks from the player hook, and ambient timing from Core's once-per-second maintenance event. Game start assigns four character slots to adventure players. The shared resource pack supplies all referenced DE sound events.
