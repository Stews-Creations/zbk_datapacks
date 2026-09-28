# ===================================
# TELEPORTER - SETUP END DISPLAY
# ===================================
# Purpose: Show or hide end marker text display and interaction based on two-way setting
# Executed as the start marker
# ===================================

# Must be linked
execute store result score #active_tp_id teleporter_id run scoreboard players get @s teleporter_id
execute unless score #active_tp_id teleporter_id matches 1.. run return 0

# Check mode (0=one-way, 1=two-way, 2=auto-return)
scoreboard players set #tp_mode teleporter_price 1
execute if data entity @s data.two_way store result score #tp_mode teleporter_price run data get entity @s data.two_way 1
execute if data entity @s data.mode store result score #tp_mode teleporter_price run data get entity @s data.mode 1

# If two-way: show price on end marker display and ensure interaction exists
execute if score #tp_mode teleporter_price matches 1 store result score $teleporter_temp teleporter_price run data get entity @s data.name 1
execute if score #tp_mode teleporter_price matches 1 as @e[type=marker,tag=teleporter,tag=tp_end] if score @s teleporter_id = #active_tp_id teleporter_id at @s run function zbk:map_elements/teleporter/management/show_return_display
# Spawn end interaction if missing (kill first to avoid duplicates)
execute if score #tp_mode teleporter_price matches 1 as @e[type=marker,tag=teleporter,tag=tp_end] if score @s teleporter_id = #active_tp_id teleporter_id at @s run kill @e[type=interaction,tag=teleporter_interaction,distance=..2,limit=1]
execute if score #tp_mode teleporter_price matches 1 as @e[type=marker,tag=teleporter,tag=tp_end] if score @s teleporter_id = #active_tp_id teleporter_id at @s run summon minecraft:interaction ~ ~0.5 ~ {width:1.5f,height:1.5f,response:true,Tags:["teleporter_interaction"]}

# If NOT two-way: hide end marker display and remove interaction
execute unless score #tp_mode teleporter_price matches 1 as @e[type=marker,tag=teleporter,tag=tp_end] if score @s teleporter_id = #active_tp_id teleporter_id at @s as @e[type=text_display,tag=teleporter_end_text_display,distance=..2,limit=1] run data modify entity @s text_opacity set value -1b
execute unless score #tp_mode teleporter_price matches 1 as @e[type=marker,tag=teleporter,tag=tp_end] if score @s teleporter_id = #active_tp_id teleporter_id at @s run kill @e[type=interaction,tag=teleporter_interaction,distance=..2,limit=1]
