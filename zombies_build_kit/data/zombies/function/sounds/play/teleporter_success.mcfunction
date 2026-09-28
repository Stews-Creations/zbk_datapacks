function zbk:dispatch/sound_teleporter_success
execute if data storage zbk:events result{blocked:1b} run return 0
# Shared core audio cue.
playsound minecraft:entity.enderman.teleport master @a[distance=..7] ~ ~ ~ 1 1
