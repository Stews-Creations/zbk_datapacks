function zbk:dispatch/sound_dog_death
execute if data storage zbk:events result{blocked:1b} run return 0
# Shared core audio cue.
playsound minecraft:entity.wolf.death music @a[distance=..8] ~ ~ ~ 0.3 1
