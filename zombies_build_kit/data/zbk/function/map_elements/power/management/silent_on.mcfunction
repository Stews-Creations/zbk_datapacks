# === SILENT POWER ON ===
# Called when power is not required for the map
# Turns power on without effects/sounds

scoreboard players set #power power 1

# Light up lamps
execute as @e[type=marker,tag=power_marker] at @s run fill ~-3 ~-3 ~-3 ~3 ~3 ~3 minecraft:redstone_lamp[lit=true] replace minecraft:redstone_lamp

# Open all powered doors
execute as @e[type=marker,tag=door_powered] at @s run function zbk:map_elements/door/powered/open

# Open all custom power doors
execute as @e[type=marker,tag=custom_door_1,scores={custom_door_power=1}] run function zbk:map_elements/custom_door/management/power_open

# Fire power on toggle signals (pulse skipped - power never truly turns on/off)
execute as @e[type=marker,tag=signal_power_on,tag=signal_toggle] at @s run setblock ~ ~ ~ redstone_block
