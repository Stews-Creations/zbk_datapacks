# ===================================
# TELEPORTER - RESET SINGLE (AFTER COOLDOWN)
# ===================================
# Purpose: Reset a teleporter after cooldown expires
# Executed as the start marker
# ===================================

# Remove all state tags
tag @s remove tp_purchased
tag @s remove tp_reverse
tag @s remove tp_auto_return_pending
scoreboard players reset @s teleporter_cooldown
scoreboard players reset @s teleporter_auto_return

# Show price on start text display
function zbk:map_elements/teleporter/management/show_start_display

# Respawn start interaction entity
summon minecraft:interaction ~ ~0.5 ~ {width:1.5f,height:1.5f,response:true,Tags:["teleporter_interaction"]}

# Check mode setting
scoreboard players set #tp_mode teleporter_price 1
execute if data entity @s data.two_way store result score #tp_mode teleporter_price run data get entity @s data.two_way 1
execute if data entity @s data.mode store result score #tp_mode teleporter_price run data get entity @s data.mode 1

# If two-way: show price on end text display and respawn end interaction
execute if score #tp_mode teleporter_price matches 1 store result score #active_tp_id teleporter_id run scoreboard players get @s teleporter_id
execute if score #tp_mode teleporter_price matches 1 store result score $teleporter_temp teleporter_price run data get entity @s data.name 1
execute if score #tp_mode teleporter_price matches 1 as @e[type=marker,tag=teleporter,tag=tp_end] if score @s teleporter_id = #active_tp_id teleporter_id at @s run function zbk:map_elements/teleporter/management/show_return_display
execute if score #tp_mode teleporter_price matches 1 as @e[type=marker,tag=teleporter,tag=tp_end] if score @s teleporter_id = #active_tp_id teleporter_id at @s run summon minecraft:interaction ~ ~0.5 ~ {width:1.5f,height:1.5f,response:true,Tags:["teleporter_interaction"]}

# Audio feedback
function zbk:sounds/play/teleporter_available
execute if score #tp_mode teleporter_price matches 1 as @e[type=marker,tag=teleporter,tag=tp_end] if score @s teleporter_id = #active_tp_id teleporter_id at @s run function zbk:sounds/play/teleporter_available

execute as @a[tag=debug,scores={debug_level=4..},distance=..20] run tellraw @s [{"text":"[Teleporter] ","color":"light_purple"},{"text":"Cooldown complete - teleporter ready!","color":"green"}]
