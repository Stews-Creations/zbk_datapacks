function zbk:waves/events/sound_round_start
execute if data storage zbk:events result{blocked:1b} run return 0
# Shared core audio cue.
playsound zbk:round.start music @a ~ ~ ~ 1000 1
