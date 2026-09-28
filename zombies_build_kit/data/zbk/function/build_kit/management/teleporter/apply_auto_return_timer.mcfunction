# === APPLY TELEPORTER AUTO-RETURN TIMER ===
# Macro function - receives timer (seconds) as parameter

execute unless entity @e[tag=tp_dialog_target,limit=1] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Warning: This marker is not linked! Assign a Link ID to connect it to a Start marker.","color":"red"}]
execute unless entity @e[tag=tp_dialog_target,limit=1] run return fail

$scoreboard players set #selected_auto_return_timer global $(timer)
execute if score #selected_auto_return_timer global matches ..5 run scoreboard players set #selected_auto_return_timer global 6

execute store result entity @e[tag=tp_dialog_target,limit=1] data.auto_return_timer int 1 run scoreboard players get #selected_auto_return_timer global

tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Auto-return timer set to ","color":"green"},{"score":{"name":"#selected_auto_return_timer","objective":"global"},"color":"yellow","bold":true},{"text":" seconds","color":"green"}]

function zbk:build_kit/management/teleporter/dialogs/open_config_dialog_refresh
