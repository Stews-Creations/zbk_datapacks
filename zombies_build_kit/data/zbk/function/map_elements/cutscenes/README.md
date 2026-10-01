# Cutscenes Module

Owns reusable opening and ending cutscene orchestration for placed Build Kit cutscene markers.

## Runtime Contract

- `cutscene_start_timed` and reusable pan-camera markers remain the source of truth for generic opening cutscenes.
- Opening and ending cameras attach players after a five-tick spawn delay, then reapply spectator attachment every tick so detaching cannot leave players flying freely. Players tagged `disable_tp` are exempt. Attachment stops when the matching cutscene ends or its camera is removed; stop/reset clears scheduled attachment callbacks.
- Generic game-over flows set title timing to `10` ticks fade-in, `70` ticks visible, and `20` ticks fade-out (`5 seconds` total), so timing left by another title-based effect cannot keep the game-over title on screen.

## Public Commands

- `function zbk:map_elements/cutscenes/start_game/flow/intercept` starts the cutscene-aware Start Game flow.
- `function zbk:map_elements/cutscenes/management/stop_active` stops any active reusable cutscene and restores player mode.

## Camera milestone dispatch

End-game title and dialog milestones each check their endpoint once before invoking `end_game/display/show_title` or `end_game/display/show_dialog`. All cameras still move before title, dialog, and finish phases. Start-game camera movement and endpoint checks retain their existing behavior. These synchronous helpers add no schedule and do not change the existing stop, skip, reload, or game-initialization paths.

## Responsibility folders

Each opening/ending sequence separates `flow/` for state transitions, `camera/` for movement, and `build_kit/` for marker placement/deletion. Ending title/dialog presentation lives in `end_game/display/`. Shared configuration dialogs and Build Manager adapters live in the module-level `build_kit/` folder.
