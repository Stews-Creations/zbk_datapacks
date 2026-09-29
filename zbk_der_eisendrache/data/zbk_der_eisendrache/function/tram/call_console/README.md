# Tram Call Console

Owns the single persistent placement marker, derived display model, interaction hitbox, and call-manager boundary for the Der Eisendrache Tram console.

## Placement

Placing the console again moves its single persistent marker and rebuilds the runtime display. Select Der Eisendrache, stand at the model origin, and choose the direction its instrument face should point:

```mcfunction
function zbk_der_eisendrache:tram/call_console/spawning/summon {facing:"north"}
```

Valid facings are `north`, `east`, `south`, and `west`.

The `tram_call_console` marker is persistent configuration. `call_console/initialize` removes the derived display and interaction entity, then recreates them from this marker only while Map 2 is active. The parent Tram `initialize` owns this lifecycle call.

## Display and lamps

The body is one baked `zbk_der_eisendrache:props/tram/tram_console` item model containing a compact faceted circular/oval panel, metal rim, two indicator lamps, a low stepped pedestal, and a compact square hand wheel with four connected spokes and a raised hub. The wheel sits on the lower metal section beneath the black display area and shares the panel's subtle 10-degree upward tilt. An angled text display sits just above the black surface and uses the same physical presentation angle. The body, two lamps, and status text ride an invisible `tram_call_console_root` display and use maximum block and sky brightness so nearby or overlapping blocks do not darken them.

The left and right full-bright lamps are separate model pieces. For the current behavior contract, the left lamp defaults to redstone and the right to emerald. The sibling Easter egg temporarily changes both lamps during its flicker sequence.

## Interaction and manager

The runtime display includes a compact `1.6`-block-wide, `1.0`-block-high interaction entity centered over the controls. It stays inside the console's footprint to reduce interference with weapons fired nearby. `call_console/on_tick` consumes each recorded right-click, resolves the exact player UUID stored by the interaction entity, and delegates as that player to `management/call`; it does not choose a Tram ID itself.

`management/call` is the single decision boundary for the upcoming console logic. Its temporary implementation invokes `tram/management/call {id:2}` only while Tram 2 is idle away from the called platform, neither member of the paired Tram 1/2 movement is active, and the interacting player has `de_fuse = 1`. Every interaction plays the Tram lever sound for players within 3 blocks of the console. A successful call plays the Maxis called announcement for every player and resets the caller's `de_fuse` score to `0`; a caller missing the Fuse hears the Maxis Fuse announcement privately. That failure announcement has a per-player cooldown of 100 ticks (5 seconds), preventing repeated interactions from spamming the voice line while retaining debug-only chat feedback. Rejected interactions never consume a Fuse. Chat diagnostics distinguish a missing Fuse, active movement, an already-present tram, and other unavailable states only for callers tagged `debug`; successful-call chat also requires that tag. Rejection still exits immediately for untagged players, preserving their Fuse. The console display and existing voice announcements remain normal gameplay feedback. Future selection, availability, flicker, and lamp-state rules belong in or behind this manager without changing the interaction entity or display model.

Players qualified by the sibling [`easter_egg/`](../easter_egg/) subsystem count successful calls independently. Their fifth call is replaced once per game: the Fuse is consumed immediately, the console locks for an 18-tick (0.9-second) emerald/black dual-lamp flicker, and Tram 1 is called instead. Other players keep their own qualification, count, and one-time completion state.

The status display reports `CALL TRAM` while Tram 2 is waiting away from the platform, `TRAM MOVING` while either member of the paired operation is in its closing delay or route movement, and `AT PLATFORM` after Tram 2 reaches the called platform.

## Rendering distance and bounds

The console uses `view_range:0.5f`, nominally 32 blocks at 100% Entity Distance,
instead of the former 128 multiplier. Client settings and entity tracking also
limit visibility. The baked body, separate lamps, and status text use a conservative
4-block-wide, 2-block-high culling box covering the tilted panel and every facing.
The invisible root has a 1-block box. These spawn-time settings are reapplied by
the parent Tram initialization on `/reload`; persistent markers and interactions
are unchanged.

The baked body cancels the item renderer half-turn and retains the authored origin
and facing. Reload rebuilds it from the existing marker; lamp updates, status text,
and the interaction hitbox remain independently controlled.

The baked model enables conservative hidden-face removal during generation.
Only complete faces covered by opaque axis-aligned cuboids are removed; partially
exposed faces, transparent surfaces, and arbitrary rotations are retained.
Exterior coordinates, UVs, bounds, and runtime transforms are preserved. These
geometry-only updates apply with F3+T without rebuilding runtime entities.
