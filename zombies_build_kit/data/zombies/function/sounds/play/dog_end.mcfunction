function zbk:dispatch/sound_dog_end
execute if data storage zbk:events result{blocked:1b} run return 0
# Shared core audio cue.
playsound minecraft:entity.wolf.ambient music @s ~ ~ ~ 0.2 1
