function zbk:dispatch/sound_dog_spawn
execute if data storage zbk:events result{blocked:1b} run return 0
# Shared core audio cue.
playsound minecraft:entity.wolf.growl music @a[distance=..15] ~ ~ ~ 1 1
