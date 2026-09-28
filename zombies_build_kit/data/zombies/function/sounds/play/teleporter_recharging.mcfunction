function zbk:dispatch/sound_teleporter_recharging
execute if data storage zbk:events result{blocked:1b} run return 0
# Shared core audio cue.
playsound minecraft:block.beacon.deactivate master @a[distance=..7] ~ ~ ~ 1 1
