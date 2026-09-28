function zbk:dispatch/sound_teleporter_buy
execute if data storage zbk:events result{blocked:1b} run return 0
# Shared core audio cue.
playsound minecraft:block.portal.trigger master @s ~ ~ ~ 0.5 1
