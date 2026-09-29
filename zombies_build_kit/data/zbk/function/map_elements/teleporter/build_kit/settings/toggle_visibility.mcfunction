# === TOGGLE TELEPORTER VISIBILITY ===
# Shows or hides the teleporter text display via tp_dialog_target (start marker)

execute unless entity @e[tag=tp_dialog_target,limit=1] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Warning: This marker is not linked! Assign a Link ID to connect it to a Start marker.","color":"red"}]
execute unless entity @e[tag=tp_dialog_target,limit=1] run return fail

# Check current visibility
execute as @e[tag=tp_dialog_target,limit=1] at @s as @e[type=text_display,tag=teleporter_text_display,distance=..2,limit=1] store result score #current_opacity global run data get entity @s text_opacity

# Toggle
execute if score #current_opacity global matches 0.. as @e[tag=tp_dialog_target,limit=1] at @s as @e[type=text_display,tag=teleporter_text_display,distance=..2,limit=1] run data modify entity @s text_opacity set value -1b
execute if score #current_opacity global matches ..-1 as @e[tag=tp_dialog_target,limit=1] at @s as @e[type=text_display,tag=teleporter_text_display,distance=..2,limit=1] run data modify entity @s text_opacity set value 127b

# Feedback
execute if score #current_opacity global matches 0.. run tellraw @a [{"text":"[Build Manager] ","color":"gold"},{"text":"Teleporter hidden","color":"yellow"}]
execute if score #current_opacity global matches ..-1 run tellraw @a [{"text":"[Build Manager] ","color":"gold"},{"text":"Teleporter visible","color":"green"}]

# Reopen the dialog
function zbk:map_elements/teleporter/build_kit/dialogs/open_config_dialog_refresh
