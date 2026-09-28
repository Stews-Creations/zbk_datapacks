function zbk:dispatch/sound_game_start
execute if data storage zbk:events result{blocked:1b} run return 0
# Shared core audio cue.
playsound zbk:game.start music @a ~ ~ ~ 1000 1
