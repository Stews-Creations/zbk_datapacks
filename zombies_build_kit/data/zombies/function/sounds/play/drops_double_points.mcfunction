function zbk:dispatch/sound_drops_double_points
execute if data storage zbk:events result{blocked:1b} run return 0
# Shared core audio cue.
execute as @a at @s run playsound zbk:drops.double_points ambient @s ~ ~ ~ 1 1 1
