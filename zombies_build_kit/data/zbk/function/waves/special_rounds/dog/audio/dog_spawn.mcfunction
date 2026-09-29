function zbk:waves/special_rounds/dog/events/sound_dog_spawn
execute if data storage zbk:events result{blocked:1b} run return 0
# Shared core audio cue.
playsound zbk:dog.spawn master @a ~ ~ ~ 1 1
