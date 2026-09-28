function zbk:dispatch/sound_dog_end
execute if data storage zbk:events result{blocked:1b} run return 0
# Shared core audio cue.
playsound zbk:dog.end music @s ~ ~ ~ 0.2 1
