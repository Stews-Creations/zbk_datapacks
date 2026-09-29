# Der Eisendrache player voice state

Owns the four shared character callout cooldowns. The base pack assigns character slots; this provider maintains its own cooldown values in `zbk.de`.

`on_load` clears cooldowns, `on_tick` advances them through the base pack voice event, and `on_tick_as_player` delegates damage checks to the player health module. Individual cue replacements and callout triggers belong to the gameplay module that causes them, under `audio/` and `audio/voice/trigger/`.
