# === CLEAR JUMP PAD LINK ===
# Removes link ID from the originally interacted marker

# Clear the ID (set to 0)
execute if entity @e[tag=jp_dialog_interacted,limit=1] run scoreboard players set @e[tag=jp_dialog_interacted,limit=1] jump_pad_id 0

# Add unlinked tag back
execute if entity @e[tag=jp_dialog_interacted,limit=1] run tag @e[tag=jp_dialog_interacted,limit=1] add jp_unlinked

# Feedback to player
tellraw @a [{"text":"[Build Manager] ","color":"gold"},{"text":"Jump Pad marker unlinked","color":"green"}]

# Reopen the dialog to keep it open
function zbk:map_elements/jump_pad/build_kit/dialogs/open_config_dialog_refresh
