# === APPLY TELEPORTER MODE ===
# Macro function - receives mode as parameter
# Modes: 0 = one-way, 1 = two-way, 2 = auto-return

execute unless entity @e[tag=tp_dialog_target,limit=1] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Warning: This marker is not linked! Assign a Link ID to connect it to a Start marker.","color":"red"}]
execute unless entity @e[tag=tp_dialog_target,limit=1] run return fail

$scoreboard players set #selected_mode global $(mode)
execute if score #selected_mode global matches ..0 run scoreboard players set #selected_mode global 0
execute if score #selected_mode global matches 3.. run scoreboard players set #selected_mode global 2

execute store result entity @e[tag=tp_dialog_target,limit=1] data.mode int 1 run scoreboard players get #selected_mode global
execute if score #selected_mode global matches 1 run data modify entity @e[tag=tp_dialog_target,limit=1] data.two_way set value 1
execute unless score #selected_mode global matches 1 run data modify entity @e[tag=tp_dialog_target,limit=1] data.two_way set value 0

execute if score #selected_mode global matches 0 run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Teleporter mode set to ","color":"green"},{"text":"One-Way","color":"red","bold":true}]
execute if score #selected_mode global matches 1 run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Teleporter mode set to ","color":"green"},{"text":"Two-Way","color":"yellow","bold":true}]
execute if score #selected_mode global matches 2 run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Teleporter mode set to ","color":"green"},{"text":"Auto-Return","color":"light_purple","bold":true}]

execute as @e[tag=tp_dialog_target,limit=1] run function zbk:map_elements/teleporter/display/setup_end_display
function zbk:map_elements/teleporter/build_kit/dialogs/open_config_dialog_refresh
