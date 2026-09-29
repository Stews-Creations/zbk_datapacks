# === APPLY TELEPORTER RADIUS ===
# Macro function - receives radius (blocks) as parameter

execute unless entity @e[tag=tp_dialog_target,limit=1] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Warning: This marker is not linked! Assign a Link ID to connect it to a Start marker.","color":"red"}]
execute unless entity @e[tag=tp_dialog_target,limit=1] run return fail

$execute as @e[tag=tp_dialog_target,limit=1] run data modify entity @s data.radius set value $(radius)

$tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Teleporter radius set to ","color":"green"},{"text":"$(radius)","color":"yellow","bold":true},{"text":" blocks","color":"green"}]

# Reopen the dialog
function zbk:map_elements/teleporter/build_kit/dialogs/open_config_dialog_refresh
