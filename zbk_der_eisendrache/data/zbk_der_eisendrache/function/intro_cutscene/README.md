# Der Eisendrache intro cutscene

This module owns the DE opening video, camera handoff, and deferred game-start ticket. Core owns game state and validates the eventual resume request.

## Start requirements

Core API 1.0.0 must have selected this provider. The rocket must be rebuilt and an armor stand tagged `intro_cutscene` must exist. The `before_game_start` listener blocks an unready rocket, skips the intro for an immediate or resumed start, and otherwise requests deferral when the camera exists. A missing camera allows Core to continue without the DE intro.

The `game_start_deferred` listener copies Core's owner, token, and generation ticket before starting playback. Players spectate the persistent camera while `#global cutscene_active` is `5`.

## Completion and cleanup

The `cutscene_tick` listener waits for playback to finish. `management/finish` schedules a resume outside the event dispatch, once per ticket. Core rechecks readiness and accepts the ticket at most once. Reset and reload cancel the local callback and invalidate pending starts. An inactive provider cannot resume a game.

The `cutscene_stop` listener remains available after provider deactivation while state `5` or the local video flag identifies an owned playback session. It stops the video, audio, stopwatch, and delayed camera handoff. Core's shared cleanup restores player state and removes temporary cameras; the placed `intro_cutscene` armor stand is preserved.

## Generated playback

The generated `video/` functions render 442x248 frames at 20 frames per second, lasting about 86 seconds. Stopwatch timing skips overdue frames when server ticks lag. Playback stops on provider deactivation. Cleanup restores title timing to 10 ticks fade-in, 70 ticks visible, and 20 ticks fade-out.

Treat `video/` as generated output. Its original video source and generator are not included in this datapack; gameplay and ticket handling belong in `management/` and the map's event listeners.
