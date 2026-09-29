# === APPLY JUMP PAD LINK ID ===
# Macro function - receives ID as parameter
# Assigns the ID to the originally interacted marker (start, peak, or end)

# Store the ID value in scoreboard
$scoreboard players set #selected_id global $(id)

# Apply to the interacted marker
execute if entity @e[tag=jp_dialog_interacted,limit=1] run scoreboard players operation @e[tag=jp_dialog_interacted,limit=1] jump_pad_id = #selected_id global

# Remove unlinked tag if present
execute if entity @e[tag=jp_dialog_interacted,tag=jp_unlinked,limit=1] run tag @e[tag=jp_dialog_interacted,tag=jp_unlinked,limit=1] remove jp_unlinked

# Get marker type for feedback
execute if entity @e[tag=jp_dialog_interacted,tag=jp_start,limit=1] run data modify storage zbk:temp marker_type set value "Start"
execute if entity @e[tag=jp_dialog_interacted,tag=jp_peak,limit=1] run data modify storage zbk:temp marker_type set value "Peak"
execute if entity @e[tag=jp_dialog_interacted,tag=jp_end,limit=1] run data modify storage zbk:temp marker_type set value "End"

# Feedback to player
function zbk:map_elements/jump_pad/build_kit/links/feedback_link_assigned with storage zbk:temp

# Reopen the dialog to keep it open
function zbk:map_elements/jump_pad/build_kit/dialogs/open_config_dialog_refresh
