# === OPEN TELEPORTER AUTO-RETURN MARKER DIALOG ===
# Marker-only menu for auto-return destinations.

scoreboard players set #current_id global 0
execute if entity @e[tag=tp_dialog_interacted,tag=tp_auto_return,limit=1] store result score #current_id global run scoreboard players get @e[tag=tp_dialog_interacted,tag=tp_auto_return,limit=1] teleporter_id

function zbk:map_elements/teleporter/build_kit/links/scan_used_ids

data modify storage zbk:temp teleporter_auto_return_dialog set value {current_id:0,used_ids:"None"}
execute store result storage zbk:temp teleporter_auto_return_dialog.current_id int 1 run scoreboard players get #current_id global
data modify storage zbk:temp teleporter_auto_return_dialog.used_ids set from storage zbk:temp used_ids_string

function zbk:map_elements/teleporter/build_kit/dialogs/show_auto_return_dialog with storage zbk:temp teleporter_auto_return_dialog
