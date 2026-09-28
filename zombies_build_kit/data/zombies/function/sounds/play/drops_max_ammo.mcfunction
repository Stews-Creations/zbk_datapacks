function zbk:dispatch/sound_drops_max_ammo
execute if data storage zbk:events result{blocked:1b} run return 0
# Shared core audio cue.
execute as @a at @s run playsound zbk:drops.max_ammo ambient @s ~ ~ ~ 1 1 1
