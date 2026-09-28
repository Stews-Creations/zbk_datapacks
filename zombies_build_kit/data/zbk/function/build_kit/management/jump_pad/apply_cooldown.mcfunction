# === APPLY JUMP PAD COOLDOWN ===
# Macro function - receives cooldown (seconds) as parameter
# Applies the cooldown to the resolved jp_start marker via jp_dialog_target tag

# If not linked (no start marker resolved), warn and bail
execute unless entity @e[tag=jp_dialog_target,limit=1] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Warning: This marker is not linked! Assign a Link ID to connect it to a Start marker.","color":"red"}]
execute unless entity @e[tag=jp_dialog_target,limit=1] run return fail

$execute as @e[tag=jp_dialog_target,limit=1] run data modify entity @s data.cooldown set value $(cooldown)

$tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Jump Pad cooldown set to ","color":"green"},{"text":"$(cooldown)","color":"yellow","bold":true},{"text":" seconds","color":"green"}]

# Reopen the dialog to keep it open
function zbk:build_kit/management/jump_pad/dialogs/open_config_dialog_refresh
