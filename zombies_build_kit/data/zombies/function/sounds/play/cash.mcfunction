function zbk:dispatch/sound_cash
execute if data storage zbk:events result{blocked:1b} run return 0
# Shared core audio cue.
playsound zbk:game.cash master @s ~ ~ ~ 0.3 1
