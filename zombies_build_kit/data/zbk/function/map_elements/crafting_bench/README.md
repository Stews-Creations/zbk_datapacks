# Crafting Bench locations

The shared `zbk:map_elements/workbench` asset is fitted to a local 3-block width, 1.95-block model height, and 1-block depth, with its floor at the marker and its front facing the placer. The model leaves 0.05 blocks of clearance within the 2-block-tall placement area to avoid ceiling clipping. Benches sit square with the block grid and keep these local dimensions. The item display uses fixed full brightness. Three adjacent 1-block interaction cubes form a combined 3-block-wide, 1-block-tall, 1-block-deep hitbox across the upper half (1 to 2 blocks above the marker). The row follows the snapped bench facing. Interactions use `response:true` and a repeatable click advancement that runs as the actual clicking player. There is no per-tick click polling. A ready recipe starts hold-to-build on right-click. Build feedback uses the progress display and sound, with no chat messages. With no ready recipe, the click goes to normal weapon input without a denial message; ammunition and cooldown rules remain in Combat. Spectators and Build Stick users do not activate recipes; downed players route to weapon input.

## Public commands and scope

```mcfunction
function zbk:map_elements/crafting_bench/spawning/give_egg
function zbk:map_elements/crafting_bench/initialize
```

Placement, recipe eligibility, and hold-to-build are implemented. Hold right-click on the same bench for 100 ticks (5 seconds). Building requires staying within 2.5 blocks of the bench floor marker, measured from the player's feet. Moving outside this range cancels progress and stops the building sound; out-of-range right-clicks pass through to normal weapon input. Completion changes the selected recipe from ready (1) to built (2), stops its sound, and removes the progress display. The completed shield display is 1.5 blocks tall and approximately 1.1 blocks wide, with its base resting on the tabletop. A completed Rocket Shield stays on its winning bench for the rest of the game. Right-clicking that bench within range grants a shield in slot 6 through Combat's existing inventory-preserving grant function, only when the player does not already own or carry one. Claiming does not remove the display. Existing owners receive normal weapon input without a duplicate or refill. Other benches remain available for the next ready recipe; the shield bench stays reserved. Ragnarok rewards and model build animations remain outside this step.

## Build Stick deletion

Use the Build Stick on a bench interaction or its marker to open the Crafting Bench dialog. Delete removes only that marker ID and all linked `cb_runtime` entities, including the bench, three interactions, completed shield, and progress text. Active builders on that bench are cancelled immediately. Other benches are untouched. Deleting the shield-owning bench clears its ownership and rechecks collected parts so the shield can be rebuilt elsewhere; already claimed player shields are kept. A deleted marker cannot reconstruct on maintenance or reset.

## Build input and sound

The exact clicked interaction is matched by the player's UUID and current interaction timestamp, then linked to its bench by `cb_id`. Consecutive native right-click repeat events keep the build alive. A gap of 5 ticks (0.25 seconds) cancels and clears all progress; this is the tolerance needed for vanilla's roughly 4-tick held-use repeat cadence, not a direct client key-release event. Completion requires a fresh click event after the full duration, so the release grace period cannot finish a build by itself. Switching benches starts over. Rapid clicks within that same native cadence cannot be distinguished from holding by this datapack.

Downing cancels immediately through the player's down hook; the active-builder tick also rejects downed/spectator builders, Build Stick users, missing or distant benches, and recipes another player has completed. Reload/reset cancels online builders; disconnected builders time out on return. Shared recipe state permits only one successful completion even when players build simultaneously.

`cb_recipe`, `cb_target`, `cb_start`, `cb_last`, and `cb_time` are per-builder state. `#duration cb_time` is set to 100 ticks on load. `zbk:zmb_building` plays once for the builder from the imported 7.5-second recording and stops on cancel or completion. The current build duration is shorter than the clip, so no sound-loop schedule is needed.

## Building progress display

Starting a build creates one temporary `cb_progress` text display above the tabletop, 1.55 blocks above the bench floor and 0.10 blocks toward the approach side. It shows `Building...` and a 20-segment white-on-dark progress bar. The display stays fixed in position and orientation, aligned with the saved bench facing and readable from the approach side. It does not turn or tilt with the viewer. Progress reads the existing build timer; text changes only when a segment changes, at most 20 updates across a full build. It adds no repeating schedule or idle-bench scan.

If several players build at one bench, the bar shows the furthest active builder without combining their timers. Cancelling or completing removes it when no other builder remains. Disconnected builders cannot keep the bar alive; reset/reload removes it with the other runtime entities. The cached `cb_bar` score is visual state only and cannot complete crafting.

## Shared recipe state

`#shield cb_build` and `#ragnarok cb_build` use 0 for missing parts, 1 for ready, and 2 for built. Game start/reset calls `management/reset_buildables`; resource reload and bench reconstruction preserve progress. Shield-part reset also clears the shield build flag. All locations share these states on every map. `#shield_bench cb_id` stores the unique winning marker ID for the current game. Only that marker reconstructs the completed shield while the recipe is built (2). Reload and chunk loading preserve ownership; game reset clears it and removes loaded shield displays. Previously unloaded benches cannot restore an old shield after reset. Shield display repair uses the existing one-second maintenance hook, with no extra per-tick work.

`management/check_ready` is called after shield pickup or Give All Shield Parts and only promotes 0 to 1. Shield readiness reads all three `rs_collected` flags. Ragnarok readiness reads `#core`, `#prongs`, and `#grip` in `rag_collected`; its future pickup system must set these flags and call the same readiness function. No Ragnarok pickup implementation is added here.

`management/next_recipe` returns 1 for a ready shield, otherwise 2 for ready Ragnarok, otherwise 0. Shield always has priority. Successful build completion calls `management/mark_built` with `{recipe:"shield"}` or `{recipe:"ragnarok"}` to promote 1 to 2. Eligibility checks and Give All Shield Parts never reset a built recipe. Use fresh Crafting Bench eggs; older inert Crafting Table eggs do not place this system.

## Display range

The bench model and shield preview use `view_range:0.5f` when spawned or reconstructed. Bench labels retain their own settings. These range multipliers depend on client entity-distance settings; they are not distances in blocks.

Progress-display selectors are restricted to the dimension of each dispatch with `distance=0..`. Each loaded progress display is updated once per tick across the three vanilla dimensions; player build progression retains its existing single shared player pass.

Once-per-second marker maintenance also uses dimension-local selectors, so each loaded bench is reconciled once per interval rather than once per dimension dispatch. Runtime reconstruction and readiness behavior remain unchanged.

## Authoring ownership

Feature-specific editor functions and Build Manager handlers live inside the owning gameplay feature's `build_kit/` folder. The shared Build Manager only owns tool input, pending selection, and routing; each feature preserves its own dialog context and cleanup order.
