# === CLEAR TELEPORTER LINK ===
# Removes link ID from the originally interacted marker

execute if entity @e[tag=tp_dialog_interacted,limit=1] run scoreboard players set @e[tag=tp_dialog_interacted,limit=1] teleporter_id 0
execute if entity @e[tag=tp_dialog_interacted,limit=1] run tag @e[tag=tp_dialog_interacted,limit=1] add tp_unlinked

tellraw @a [{"text":"[Build Manager] ","color":"gold"},{"text":"Teleporter marker unlinked","color":"green"}]

# Reopen the dialog
function zbk:build_kit/management/teleporter/dialogs/open_config_dialog_refresh
