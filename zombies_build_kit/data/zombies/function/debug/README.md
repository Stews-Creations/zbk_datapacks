# Debug Module

Provides the shared debug-message API used by all gameplay modules. Messages are sent only to players with the `debug` tag whose `debug_level` meets the required threshold.

## Public API

These one-line utility functions intentionally remain at the module root:

| Function | Minimum level | Use |
| --- | ---: | --- |
| `error {f:"FEATURE",m:"message"}` | 1 | Errors and invalid runtime states |
| `warn {f:"FEATURE",m:"message"}` | 2 | Warnings and reset notices |
| `event {f:"FEATURE",m:"message"}` | 3 | Important gameplay events |
| `info {f:"FEATURE",m:"message"}` | 4 | Detailed development information |

`f` is the short feature label shown in brackets and `m` is the message body.

## Diagnostics

Direct developer diagnostics such as `pap_icon_test` may remain at the root because they are manually invoked tools, not runtime subsystem implementation.

`function zombies:debug/pap_icon_test` previews the Pack-a-Punch and element glyphs from the shared `zombies:hud` actionbar font.

Do not use unconditional `tellraw @a` for routine diagnostics; route messages through this API.

## Full HUD test

Run as the player to inspect:

```mcfunction
/function zombies:debug/hud_test
```

Grants four perks in a fixed order (Juggernog, Stamina Up, Speed Cola, Double Tap), clears Quick Revive and Mule Kick perk scores, raises the active gun to at least Pack-a-Punch I, refreshes BO3 capacity/ammo through its normal pack handler, and sets the shared round to 5. An empty active weapon slot is reported and left empty; existing higher tiers are preserved. Activates the three actionbar timed powerups using their gameplay handlers: Insta Kill and Double Points for 600 ticks (30 seconds), Fire Sale for 1560 ticks (78 seconds). Re-running refreshes their timers. Death Machine is excluded so the packed weapon stays visible.

This changes real gameplay state: round and timed powerups affect the whole session, including Fire Sale boxes. It does not start a wave, spawn enemies, charge points, or enable debug logging. Console invocation must use `execute as <player> at @s run function zombies:debug/hud_test`.
