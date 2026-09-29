function zbk:map_elements/power/events/sound_power_on
execute if data storage zbk:events result{blocked:1b} run return 0
# Shared core audio cue.
execute as @a at @s run playsound minecraft:block.beacon.activate master @s ~ ~ ~ 0.6 1
