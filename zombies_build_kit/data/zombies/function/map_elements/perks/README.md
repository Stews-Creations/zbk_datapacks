# Perks

Owns the reusable perk machines, Der Wunderfizz, purchase limits, acquisition order, player effects, and perk clearing. The six implemented perks are Juggernog, Stamina Up, Speed Cola, Double Tap, Quick Revive, and Mule Kick.

## Lifecycle and state

`on_load` defines perk objectives and triggers. `initialize` clears runtime entities and player perk state, and `on_tick` and `on_tick_as_player` maintain machines, effects, and interactions. Each successful grant increments `perk_count` and the player's `perk_order`, then stores that acquisition position in the perk-specific score.

The standard purchase limit remains 4. Maps may raise that limit separately; the [player actionbar](../../player/README.md#layered-actionbar-hud) already reserves nine positions and reads acquisition scores from 1 through 9. Perks no longer occupy or clear hotbar slots.

## Responsibility folders

Each named perk folder owns placement, purchase, grant, sound, and sign updates. `wunderfizz/` owns random selection, claiming, presentation, and location movement. `management/` owns shared application, clearing, and bonus handling.

Persistent placement markers are the source of truth. `initialize` rebuilds runtime machines from them. Public purchase and grant functions remain guarded by the owning perk state and the shared limit.
