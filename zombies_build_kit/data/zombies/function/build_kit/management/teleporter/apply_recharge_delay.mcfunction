# === APPLY TELEPORTER RECHARGE DELAY ===
# Macro function - receives recharge_delay (seconds) as parameter

execute unless entity @e[tag=tp_dialog_target,limit=1] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Warning: This marker is not linked! Assign a Link ID to connect it to a Start marker.","color":"red"}]
execute unless entity @e[tag=tp_dialog_target,limit=1] run return fail

$execute as @e[tag=tp_dialog_target,limit=1] run data modify entity @s data.recharge_delay set value $(recharge_delay)

$tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Recharge delay set to ","color":"green"},{"text":"$(recharge_delay)","color":"yellow","bold":true},{"text":" seconds","color":"green"}]

# Reopen the dialog
function zombies:build_kit/management/teleporter/dialogs/open_config_dialog_refresh
