# === APPLY TELEPORTER LINK ID ===
# Macro function - receives ID as parameter
# Assigns the ID to the originally interacted marker (start or end)

# Store the ID value in scoreboard
$scoreboard players set #selected_id global $(id)

# Apply to the interacted marker
execute if entity @e[tag=tp_dialog_interacted,limit=1] run scoreboard players operation @e[tag=tp_dialog_interacted,limit=1] teleporter_id = #selected_id global

# Remove unlinked tag if present
execute if entity @e[tag=tp_dialog_interacted,tag=tp_unlinked,limit=1] run tag @e[tag=tp_dialog_interacted,tag=tp_unlinked,limit=1] remove tp_unlinked

# Get marker type for feedback
execute if entity @e[tag=tp_dialog_interacted,tag=tp_start,limit=1] run data modify storage zombies:temp marker_type set value "Start"
execute if entity @e[tag=tp_dialog_interacted,tag=tp_end,limit=1] run data modify storage zombies:temp marker_type set value "End"
execute if entity @e[tag=tp_dialog_interacted,tag=tp_auto_return,limit=1] run data modify storage zombies:temp marker_type set value "Auto-Return"

# Feedback to player
function zombies:build_kit/management/teleporter/feedback_link_assigned with storage zombies:temp

# Reopen the dialog
function zombies:build_kit/management/teleporter/dialogs/open_config_dialog_refresh
