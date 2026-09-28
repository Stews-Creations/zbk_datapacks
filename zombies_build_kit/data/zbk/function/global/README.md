# Global Module

Defines cross-module state and timing primitives. It loads before every gameplay module and must not depend on them.

## Responsibilities

- Apply baseline gamerules and difficulty.
- Create shared objectives such as `global`, `id`, `tick`, `timer`, and temporary calculation objectives.
- Create shared teams and collision rules.
- Maintain the global 0-99 tick counter.
- Host timing utilities used by multiple modules.

## Lifecycle

Minecraft runs at 20 ticks per second, so `tick_1s` is the shared path for work that only needs one update per second. Feature-specific periodic work should be called from that hook rather than creating another permanent schedule when practical.

## Conventions

- Constants and global fake players use a `#` prefix.
- Feature-specific state belongs to the owning module, even when stored in the shared `global` objective.
- This module must remain dependency-free.

## Shared display visibility cap

`rendering/maintenance` caps loaded block, item, and text displays at `view_range:0.5f` in the Overworld, Nether, and End. The existing `tick_1s` hook runs it every 20 ticks (1 second), so previously unchecked loaded or spawned displays are reconciled within one maintenance interval. Hidden displays (`0f`) and shorter configured ranges remain unchanged. It does not alter markers, interactions, ordinary mobs, particle ranges, geometry, or animations. The storage-only custom door dimension is excluded.

The scan reads each unchecked display's range once and only writes NBT when it exceeds the cap. `#display_range temp` is synchronous scratch overwritten per entity; it is not a cache or persistent configuration. Checked entities are excluded from subsequent range reads.

For immediate application in the three player-facing dimensions:

```mcfunction
function zbk:global/rendering/refresh
```

The policy never restores ranges hidden by manual diagnostic commands. Restore those through their owning feature's initialization or visibility state. Removing the cap later does not itself restore previous ranges; owning modules must reconstruct them.

Display selectors in `rendering/scan_dimension` use an unbounded nonnegative distance filter to restrict each pass to its execution dimension. Each unchecked loaded display is read only in its own dimension.

## Display range reconciliation

The 20-tick (1-second) rendering maintenance checks only displays without `zbk_range_checked`, then marks them checked. Newly spawned or previously unseen chunk-loaded displays are capped at `0.5f`; shorter ranges and zero remain intact. The tag persists across chunk unloads. Runtime visibility setters must restore at most `0.5f`. Reload clears checked tags on loaded displays and reapplies the cap. Manual or external changes to an already checked display require removing its checked tag or running `function zbk:global/rendering/refresh` while it is loaded. This cache tracks the fixed range policy, not current visibility.
