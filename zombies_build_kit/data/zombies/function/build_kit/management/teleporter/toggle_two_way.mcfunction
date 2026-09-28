# === CYCLE TELEPORTER MODE ===
# Legacy helper kept for old command references.
# Cycles: One-Way -> Two-Way -> Auto-Return -> One-Way

execute unless entity @e[tag=tp_dialog_target,limit=1] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Warning: This marker is not linked! Assign a Link ID to connect it to a Start marker.","color":"red"}]
execute unless entity @e[tag=tp_dialog_target,limit=1] run return fail

# Read current value
scoreboard players set #current_mode global 1
execute if data entity @e[tag=tp_dialog_target,limit=1] data.two_way store result score #current_mode global run data get entity @e[tag=tp_dialog_target,limit=1] data.two_way
execute if data entity @e[tag=tp_dialog_target,limit=1] data.mode store result score #current_mode global run data get entity @e[tag=tp_dialog_target,limit=1] data.mode

scoreboard players operation #selected_mode global = #current_mode global
scoreboard players add #selected_mode global 1
execute if score #selected_mode global matches 3.. run scoreboard players set #selected_mode global 0

execute store result entity @e[tag=tp_dialog_target,limit=1] data.mode int 1 run scoreboard players get #selected_mode global
execute if score #selected_mode global matches 1 run data modify entity @e[tag=tp_dialog_target,limit=1] data.two_way set value 1
execute unless score #selected_mode global matches 1 run data modify entity @e[tag=tp_dialog_target,limit=1] data.two_way set value 0

execute if score #selected_mode global matches 0 run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Teleporter mode set to ","color":"green"},{"text":"One-Way","color":"red","bold":true}]
execute if score #selected_mode global matches 1 run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Teleporter mode set to ","color":"green"},{"text":"Two-Way","color":"yellow","bold":true}]
execute if score #selected_mode global matches 2 run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Teleporter mode set to ","color":"green"},{"text":"Auto-Return","color":"light_purple","bold":true}]

# Update end marker display visibility
execute as @e[tag=tp_dialog_target,limit=1] run function zombies:map_elements/teleporter/management/setup_end_display

# Reopen the dialog
function zombies:build_kit/management/teleporter/dialogs/open_config_dialog_refresh
