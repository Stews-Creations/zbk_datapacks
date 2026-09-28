# Der Eisendrache dragon heads

Owns the Map 2 dragon-head soul quest, linked mini-head effects and completion event. Central map orchestration selects Map 2 before runtime ticks; public placement, reset and operator completion commands retain their own map checks.

## Responsibilities

| Path | Responsibility |
| --- | --- |
| `summon/` | Place and configure large and mini heads |
| `modes/` | Activation, active-head ticking and completion |
| `animation/` | Large-head display animation |
| `souls/` | Incoming soul collection and target-specific travel animation |
| `mini_heads/` | Matching-head activation and every-tick particles |
| `core/` | Loaded-head completion snapshot, global completion and reset |
| `management/` | Operator completion command |

## Lifecycle and state

`on_load` defines objectives. Placed large-head block displays carry the head ID tag and `dragon_head_mode`, `dragon_head_souls`, `dragon_head_cooldown` and animation scores. Their placement remains authoritative; reset restores those placed heads rather than reconstructing them from separate markers. The persistent `quest_dragon_bow_spawn` marker determines where the transient bow reward appears.

`on_tick` updates active heads first. Dormant heads (mode 0) have no tick handler: nearby incoming souls activate them. Mode 1 retains its per-tick animations, independent soul count, cooldown and target-specific mannequin completion gate. Mode 3 denotes a completed head.

After active updates, `core/read_completion` rebuilds `#loaded_head_1`, `#loaded_head_2` and `#loaded_head_3` in `dragon_heads_complete`. These internal scratch scores describe loaded, completed block displays in the current execution dimension. Both `mini_heads/tick` and `core/check_completion` consume that invocation's snapshot; their callers must refresh it first. The operator completion path does the same. Nothing caches an unloaded head as present.

Mini-head activation precedes the global completion event, and mini-head particles still run every tick. `#dragon_heads_complete` counts completed loaded head IDs; `#all_dragons_complete` prevents repeated reward events until reset. A late-loaded mini head activates on the next tick when its matching completed large head is loaded.

## Interfaces and ownership

Use `function zbk_der_eisendrache:quest/dragon_heads/core/reset` to reset placed heads and transient soul/reward entities. Use `function zbk_der_eisendrache:quest/dragon_heads/management/complete_for_test` to complete loaded heads and rebuild the reward at its existing marker. Both require Map 2.

The [parent quest](../README.md) processes native killer UUID credit, then soul pots, then dragon-soul items. Dragon-soul eligibility is byte-valued custom data `{dragon_soul_marker:1b}` on any item type; ordinary or differently typed payloads are not accepted. Overlapping head radii retain their existing independent processing. The collector consumes the item only after the earlier native-credit pass.

Dragon sound events use playback volume 0.25, with the ready roar at 0.175 and the all-heads completion sound at 0.5. These settings apply to the large heads, linked mini-head breath and soul-suction effect.
