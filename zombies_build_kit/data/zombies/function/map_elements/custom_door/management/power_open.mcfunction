# ===================================
# CUSTOM DOOR - POWER OPEN
# ===================================
# Runs as Corner 1 with custom_door_power=1 when power turns on
# Finds linked sign(s) and triggers the open animation
# Called from: map_elements/power/management/on

# Get this corner's link ID
execute store result score #cd_power_id global run scoreboard players get @s custom_door_id
execute if score #cd_power_id global matches 0 run return 0

# Find linked signs that are not already purchased and trigger open
execute as @e[type=marker,tag=custom_door_sign,tag=!purchased] if score @s custom_door_id = #cd_power_id global at @s run function zombies:map_elements/custom_door/buy/open
