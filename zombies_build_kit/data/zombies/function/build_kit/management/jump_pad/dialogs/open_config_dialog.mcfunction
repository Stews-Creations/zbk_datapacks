# === OPEN JUMP PAD CONFIG DIALOG ===
# Opens dialog to configure jump pad price and link markers
# Works when open_dialog is on any jump pad marker type (start, peak, end)

# If open_dialog is set (new dialog open), resolve targets
execute if entity @e[tag=open_dialog,limit=1] run tag @e[tag=jp_dialog_target] remove jp_dialog_target
execute if entity @e[tag=open_dialog,limit=1] run tag @e[tag=jp_dialog_interacted] remove jp_dialog_interacted

# Tag the interacted marker
tag @e[tag=open_dialog,limit=1,sort=nearest] add jp_dialog_interacted

# Resolve to jp_start marker:
# If already a start marker, tag it directly
execute if entity @e[tag=open_dialog,tag=jp_start,limit=1] run tag @e[tag=open_dialog,tag=jp_start,limit=1,sort=nearest] add jp_dialog_target

# If peak/end marker, find linked start via jump_pad_id
execute if entity @e[tag=open_dialog,tag=!jp_start,limit=1] store result score #resolve_jp_id global run scoreboard players get @e[tag=open_dialog,limit=1,sort=nearest] jump_pad_id
execute if entity @e[tag=open_dialog,tag=!jp_start,limit=1] as @e[type=marker,tag=jump_pad,tag=jp_start] if score @s jump_pad_id = #resolve_jp_id global if score #resolve_jp_id global matches 1.. run tag @s add jp_dialog_target

# Warn if peak/end marker is not linked (can't resolve to start marker)
execute if entity @e[tag=jp_dialog_interacted,tag=!jp_start,limit=1] unless entity @e[tag=jp_dialog_target] run tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"Warning: This marker is not linked! Assign a Link ID to connect it to a Start marker.","color":"red"}]

# Clean up open_dialog tag
tag @e[tag=open_dialog] remove open_dialog

# Read current values from jp_dialog_target (start marker)
scoreboard players set #current_price global 500
execute if entity @e[tag=jp_dialog_target,limit=1] store result score #current_price global run data get entity @e[tag=jp_dialog_target,limit=1] data.name
execute if score #current_price global matches 0 run scoreboard players set #current_price global 500

scoreboard players set #current_id global 0
execute if entity @e[tag=jp_dialog_target,limit=1] store result score #current_id global run scoreboard players get @e[tag=jp_dialog_target,limit=1] jump_pad_id
# If no start marker found (unlinked peak/end), read ID from interacted marker
execute unless entity @e[tag=jp_dialog_target] if entity @e[tag=jp_dialog_interacted,limit=1] store result score #current_id global run scoreboard players get @e[tag=jp_dialog_interacted,limit=1] jump_pad_id

scoreboard players set #current_cooldown global 120
execute if entity @e[tag=jp_dialog_target,limit=1] store result score #current_cooldown global run data get entity @e[tag=jp_dialog_target,limit=1] data.cooldown
# Get require_unlock (default 1 = enabled)
scoreboard players set #require_unlock global 1
execute if entity @e[tag=jp_dialog_target,limit=1] store result score #require_unlock global run data get entity @e[tag=jp_dialog_target,limit=1] data.require_unlock

execute if score #current_cooldown global matches 0 run scoreboard players set #current_cooldown global 120

# Scan all jump pad markers for used IDs (result stored in zombies:temp used_ids_string)
function zombies:build_kit/management/jump_pad/scan_used_ids

# Store data for macro function
# Build require_unlock display text
data modify storage zombies:temp require_unlock_text set value "Enabled"
execute if score #require_unlock global matches 0 run data modify storage zombies:temp require_unlock_text set value "Disabled"

data modify storage zombies:temp jump_pad_dialog set value {current_price:500,current_id:0,used_ids:"None",current_cooldown:120,require_unlock_text:"Enabled"}
execute store result storage zombies:temp jump_pad_dialog.current_price int 1 run scoreboard players get #current_price global
execute store result storage zombies:temp jump_pad_dialog.current_id int 1 run scoreboard players get #current_id global
execute store result storage zombies:temp jump_pad_dialog.current_cooldown int 1 run scoreboard players get #current_cooldown global
data modify storage zombies:temp jump_pad_dialog.used_ids set from storage zombies:temp used_ids_string
data modify storage zombies:temp jump_pad_dialog.require_unlock_text set from storage zombies:temp require_unlock_text

# Call macro function with storage data
function zombies:build_kit/management/jump_pad/dialogs/show_config_dialog with storage zombies:temp jump_pad_dialog
