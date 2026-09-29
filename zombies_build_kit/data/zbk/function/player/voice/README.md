# Player voice state

Owns four-character assignment, shared per-character callout cooldowns, and voice lifecycle hooks. Gameplay modules own their individual cue requests, trigger rules, and playback under their own `audio/` folders.

## Lifecycle

`on_load` creates the voice objectives. `initialize` clears shared cooldowns and previous-health tracking. `management/assign` assigns character slots at match start; `management/assign_step` supplies missing assignments. `on_tick` decrements the shared cooldowns, and `on_tick_as_player` checks assignment and dispatches damage-callout processing.

The cooldown is shared across callout types for each character slot. Keep the existing lifecycle call order and executor when invoking these functions.

## Integration

`events/` dispatches voice tick notifications. Feature-specific `voice/<operation>` and `sound/voice/<cue>` event tags retain their existing IDs. A sound request may block its fallback through `zbk:global/events/request/block`. Callouts require the matching core resource pack and retain their existing character sound IDs, audience, and volume.
