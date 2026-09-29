# Der Eisendrache ambient music

`initialize` clears the ambient timer during map load. The maintenance event calls `on_tick_1s`, which advances the timer only for the active provider during a running game. Every 270 seconds it calls `play_ambient` at each player's position.

Game reset and game end call `stop_ambient` to stop music and clear the timer. Sound event IDs and playback volume are supplied by the matching Der Eisendrache resource pack.
