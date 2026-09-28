# === TOGGLE JUMP PAD VISIBILITY ===
# Shows or hides the jump pad text display via jp_dialog_target (start marker)

# If not linked (no start marker resolved), warn and bail
execute unless entity @e[tag=jp_dialog_target,limit=1] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Warning: This marker is not linked! Assign a Link ID to connect it to a Start marker.","color":"red"}]
execute unless entity @e[tag=jp_dialog_target,limit=1] run return fail

# Check current visibility by checking text_opacity on the text display near the start marker
execute as @e[tag=jp_dialog_target,limit=1] at @s as @e[type=text_display,tag=jump_pad_text_display,distance=..2,limit=1] store result score #current_opacity global run data get entity @s text_opacity

# Toggle: if visible (opacity >= 0), hide it. If hidden (opacity < 0), show it.
execute if score #current_opacity global matches 0.. as @e[tag=jp_dialog_target,limit=1] at @s as @e[type=text_display,tag=jump_pad_text_display,distance=..2,limit=1] run data modify entity @s text_opacity set value -1b
execute if score #current_opacity global matches ..-1 as @e[tag=jp_dialog_target,limit=1] at @s as @e[type=text_display,tag=jump_pad_text_display,distance=..2,limit=1] run data modify entity @s text_opacity set value 127b

# Feedback
execute if score #current_opacity global matches 0.. run tellraw @a [{"text":"[Build Manager] ","color":"gold"},{"text":"Jump Pad hidden","color":"yellow"}]
execute if score #current_opacity global matches ..-1 run tellraw @a [{"text":"[Build Manager] ","color":"gold"},{"text":"Jump Pad visible","color":"green"}]

# Reopen the dialog to keep it open
function zombies:build_kit/management/jump_pad/dialogs/open_config_dialog_refresh
