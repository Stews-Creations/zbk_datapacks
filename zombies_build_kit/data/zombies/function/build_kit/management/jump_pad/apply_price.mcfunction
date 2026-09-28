# === APPLY JUMP PAD PRICE ===
# Macro function - receives price as parameter
# Applies the price to the resolved jp_start marker via jp_dialog_target tag

# If not linked (no start marker resolved), warn and bail
execute unless entity @e[tag=jp_dialog_target,limit=1] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Warning: This marker is not linked! Assign a Link ID to connect it to a Start marker.","color":"red"}]
execute unless entity @e[tag=jp_dialog_target,limit=1] run return fail

# Store the price value in scoreboard
$scoreboard players set #selected_price global $(price)

# Apply to the dialog target start marker
execute if entity @e[tag=jp_dialog_target,limit=1] store result entity @e[tag=jp_dialog_target,limit=1] data.name int 1 run scoreboard players get #selected_price global

# Update the text display near the start marker
execute as @e[tag=jp_dialog_target,limit=1] at @s run data modify entity @n[type=text_display,tag=jump_pad_text_display,distance=..2] text set value [{"text":"Jump Pad\n","color":"aqua","bold":true},{"score":{"name":"#selected_price","objective":"global"},"color":"yellow","bold":true}]

# Feedback to player
tellraw @a [{"text":"[Build Manager] ","color":"gold"},{"text":"Jump Pad price set to ","color":"green"},{"score":{"name":"#selected_price","objective":"global"},"color":"yellow","bold":true},{"text":" points","color":"green"}]

# Reopen the dialog to keep it open
function zombies:build_kit/management/jump_pad/dialogs/open_config_dialog_refresh
