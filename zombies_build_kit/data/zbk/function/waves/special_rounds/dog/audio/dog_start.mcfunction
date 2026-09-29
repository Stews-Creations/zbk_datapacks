function zbk:waves/special_rounds/dog/events/sound_dog_start
execute if data storage zbk:events result{blocked:1b} run return 0
# Shared core audio cue.
playsound zbk:dog.start music @s ~ ~ ~ 0.2 1
playsound zbk:voice.dog voice @s ~ ~ ~ 1 1
