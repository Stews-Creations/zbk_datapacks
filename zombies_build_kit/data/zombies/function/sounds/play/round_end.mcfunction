function zbk:dispatch/sound_round_end
execute if data storage zbk:events result{blocked:1b} run return 0
# Shared core audio cue.
playsound zbk:round.end music @a ~ ~ ~ 1000 1
