function zbk:dispatch/sound_game_over
execute if data storage zbk:events result{blocked:1b} run return 0
# Shared core audio cue.
playsound zombies:game.game_over music @a ~ ~ ~ 1000 1
