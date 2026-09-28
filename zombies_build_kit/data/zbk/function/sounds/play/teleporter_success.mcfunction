function zbk:dispatch/sound_teleporter_success
execute if data storage zbk:events result{blocked:1b} run return 0
# Shared core audio cue.
playsound zbk:teleporter.success master @s ~ ~ ~ 0.5 1
