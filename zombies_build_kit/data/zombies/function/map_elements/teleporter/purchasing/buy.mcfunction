# ===================================
# TELEPORTER - BUY/PURCHASE (FORWARD: START -> END)
# ===================================
# Called when a player attempts to purchase a forward teleport
# Executed as the player
# ===================================

# Check if teleporter is busy (any active state)
execute at @s if entity @e[type=marker,tag=teleporter,tag=tp_start,tag=tp_purchased,distance=..1.75] run tellraw @s [{"text":"[TELEPORTER] ","color":"red"},{"text":"On Cooldown","color":"gold"}]
execute at @s if entity @e[type=marker,tag=teleporter,tag=tp_start,tag=tp_purchased,distance=..1.75] run return fail

execute at @s if entity @e[type=marker,tag=teleporter,tag=tp_start,tag=tp_active,distance=..1.75] run tellraw @s [{"text":"[TELEPORTER] ","color":"red"},{"text":"Already activating!","color":"gold"}]
execute at @s if entity @e[type=marker,tag=teleporter,tag=tp_start,tag=tp_active,distance=..1.75] run return fail

# Check if teleporter is linked (has valid ID > 0)
execute at @s store result score #check_tp_id teleporter_id run scoreboard players get @e[type=marker,tag=teleporter,tag=tp_start,sort=nearest,limit=1] teleporter_id
execute unless score #check_tp_id teleporter_id matches 1.. run tellraw @s [{"text":"[TELEPORTER] ","color":"red"},{"text":"Teleporter is not linked! Use build manager to link markers.","color":"gold"}]
execute unless score #check_tp_id teleporter_id matches 1.. run return fail

# Read mode from the nearest start marker (0=one-way, 1=two-way, 2=auto-return)
scoreboard players set #tp_mode teleporter_price 1
execute at @s if data entity @e[type=marker,tag=teleporter,tag=tp_start,sort=nearest,limit=1] data.two_way store result score #tp_mode teleporter_price run data get entity @e[type=marker,tag=teleporter,tag=tp_start,sort=nearest,limit=1] data.two_way 1
execute at @s if data entity @e[type=marker,tag=teleporter,tag=tp_start,sort=nearest,limit=1] data.mode store result score #tp_mode teleporter_price run data get entity @e[type=marker,tag=teleporter,tag=tp_start,sort=nearest,limit=1] data.mode 1

# Auto-return mode requires a linked auto-return marker
tag @e[tag=tp_temp_auto_return] remove tp_temp_auto_return
execute if score #tp_mode teleporter_price matches 2 as @e[type=marker,tag=teleporter,tag=tp_auto_return] if score @s teleporter_id = #check_tp_id teleporter_id run tag @s add tp_temp_auto_return
execute if score #tp_mode teleporter_price matches 2 unless entity @e[tag=tp_temp_auto_return] run tellraw @s [{"text":"[TELEPORTER] ","color":"red"},{"text":"No linked auto-return marker found!","color":"gold"}]
execute if score #tp_mode teleporter_price matches 2 unless entity @e[tag=tp_temp_auto_return] run return fail
tag @e[tag=tp_temp_auto_return] remove tp_temp_auto_return

# Store the teleporter price from the nearest marker's data.name
execute at @s store result score @s teleporter_price run data get entity @e[type=marker,tag=teleporter,tag=tp_start,sort=nearest,limit=1] data.name 1

# Check if player has enough points
execute unless score @s player_points >= @s teleporter_price run tellraw @s [{"text":"[TELEPORTER] ","color":"red"},{"text":"Not enough points","color":"gold"}]
execute unless score @s player_points >= @s teleporter_price run return fail

# Subtract points from player
scoreboard players operation @s player_points -= @s teleporter_price

# Debug message
function zombies:debug/info {f:"TELE",m:"Teleporter purchased (forward)"}

# Hide text display during activation
execute at @s as @e[type=text_display,tag=teleporter_text_display,distance=..2,limit=1] run data modify entity @s text set value '""'

# Check mode and hide end text display + kill interactions for manual return mode
execute if score #tp_mode teleporter_price matches 1 as @e[type=marker,tag=teleporter,tag=tp_end] if score @s teleporter_id = #check_tp_id teleporter_id at @s as @e[type=text_display,tag=teleporter_end_text_display,distance=..2,limit=1] run data modify entity @s text set value '""'

# Kill interaction entities so players can use guns
execute at @s run kill @e[type=interaction,tag=teleporter_interaction,distance=..2,limit=1]
execute if score #tp_mode teleporter_price matches 1 as @e[type=marker,tag=teleporter,tag=tp_end] if score @s teleporter_id = #check_tp_id teleporter_id at @s run kill @e[type=interaction,tag=teleporter_interaction,distance=..2,limit=1]

# Set tp_active tag and start duration timer (seconds * 20 = ticks)
execute at @s as @e[type=marker,tag=teleporter,tag=tp_start,sort=nearest,limit=1] run tag @s add tp_active
execute at @s store result score @e[type=marker,tag=teleporter,tag=tp_start,sort=nearest,limit=1] teleporter_duration run data get entity @e[type=marker,tag=teleporter,tag=tp_start,sort=nearest,limit=1] data.duration 20
# Fallback: if duration unset, default to 100 ticks (5 seconds)
execute at @s if score @e[type=marker,tag=teleporter,tag=tp_start,sort=nearest,limit=1] teleporter_duration matches 0 run scoreboard players set @e[type=marker,tag=teleporter,tag=tp_start,sort=nearest,limit=1] teleporter_duration 100

# Play activation sound to everyone in the departure pad's teleport radius.
execute at @s as @e[type=marker,tag=teleporter,tag=tp_start,sort=nearest,limit=1] at @s run function zombies:map_elements/teleporter/management/play_activation_sound
