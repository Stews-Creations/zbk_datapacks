# ===================================
# TELEPORTER - BUY/PURCHASE (RETURN: END -> START)
# ===================================
# Called when a player attempts to purchase a return teleport
# Only works if two-way is enabled
# Executed as the player
# ===================================

# Clean up any stale temp tags
tag @e[tag=tp_temp_match] remove tp_temp_match

# Find the end marker and get its linked start marker
execute at @s store result score #check_tp_id teleporter_id run scoreboard players get @e[type=marker,tag=teleporter,tag=tp_end,distance=..1.75,sort=nearest,limit=1] teleporter_id
execute unless score #check_tp_id teleporter_id matches 1.. run tellraw @s [{"text":"[TELEPORTER] ","color":"red"},{"text":"Teleporter is not linked!","color":"gold"}]
execute unless score #check_tp_id teleporter_id matches 1.. run return fail

# Find the matching start marker
execute as @e[type=marker,tag=teleporter,tag=tp_start] if score @s teleporter_id = #check_tp_id teleporter_id run tag @s add tp_temp_match
execute unless entity @e[tag=tp_temp_match] run tellraw @s [{"text":"[TELEPORTER] ","color":"red"},{"text":"No linked start marker found!","color":"gold"}]
execute unless entity @e[tag=tp_temp_match] run return fail

# Check if two-way mode is enabled
scoreboard players set #tp_mode teleporter_price 1
execute if data entity @e[tag=tp_temp_match,limit=1] data.two_way store result score #tp_mode teleporter_price run data get entity @e[tag=tp_temp_match,limit=1] data.two_way 1
execute if data entity @e[tag=tp_temp_match,limit=1] data.mode store result score #tp_mode teleporter_price run data get entity @e[tag=tp_temp_match,limit=1] data.mode 1
execute unless score #tp_mode teleporter_price matches 1 run tellraw @s [{"text":"[TELEPORTER] ","color":"red"},{"text":"This teleporter is not in two-way mode","color":"gold"}]
execute unless score #tp_mode teleporter_price matches 1 run return fail

# Check if teleporter is busy
execute if entity @e[tag=tp_temp_match,tag=tp_active] run tellraw @s [{"text":"[TELEPORTER] ","color":"red"},{"text":"Already activating!","color":"gold"}]
execute if entity @e[tag=tp_temp_match,tag=tp_active] run return fail

execute if entity @e[tag=tp_temp_match,tag=tp_purchased] run tellraw @s [{"text":"[TELEPORTER] ","color":"red"},{"text":"On Cooldown","color":"gold"}]
execute if entity @e[tag=tp_temp_match,tag=tp_purchased] run return fail

# Store the teleporter price from the start marker's data.name (shared price)
execute store result score @s teleporter_price run data get entity @e[tag=tp_temp_match,limit=1] data.name 1

# Check if player has enough points
execute unless score @s player_points >= @s teleporter_price run tellraw @s [{"text":"[TELEPORTER] ","color":"red"},{"text":"Not enough points","color":"gold"}]
execute unless score @s player_points >= @s teleporter_price run return fail

# Subtract points from player
scoreboard players operation @s player_points -= @s teleporter_price

# Debug message
function zbk:debug/info {f:"TELE",m:"Teleporter purchased (return)"}

# Hide text displays during activation
execute at @s as @e[type=text_display,tag=teleporter_end_text_display,distance=..2,limit=1] run data modify entity @s text set value '""'
execute as @e[tag=tp_temp_match,limit=1] at @s as @e[type=text_display,tag=teleporter_text_display,distance=..2,limit=1] run data modify entity @s text set value '""'

# Kill interaction entities so players can use guns
execute at @s run kill @e[type=interaction,tag=teleporter_interaction,distance=..2,limit=1]
execute as @e[tag=tp_temp_match,limit=1] at @s run kill @e[type=interaction,tag=teleporter_interaction,distance=..2,limit=1]

# Set tp_active + tp_reverse on start marker and start duration timer
execute as @e[tag=tp_temp_match,limit=1] run tag @s add tp_active
execute as @e[tag=tp_temp_match,limit=1] run tag @s add tp_reverse
execute store result score @e[tag=tp_temp_match,limit=1] teleporter_duration run data get entity @e[tag=tp_temp_match,limit=1] data.duration 20
execute if score @e[tag=tp_temp_match,limit=1] teleporter_duration matches 0 run scoreboard players set @e[tag=tp_temp_match,limit=1] teleporter_duration 100

# Use the linked start marker's radius, centered on the departure end pad.
execute at @s as @e[tag=tp_temp_match,limit=1] at @e[type=marker,tag=teleporter,tag=tp_end,distance=..1.75,sort=nearest,limit=1] run function zbk:map_elements/teleporter/management/play_activation_sound

# Clean up temp tag
tag @e[tag=tp_temp_match] remove tp_temp_match
