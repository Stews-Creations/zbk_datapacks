# === OPEN TELEPORTER CONFIG DIALOG ===
# Opens dialog to configure teleporter settings
# Works when open_dialog is on any teleporter marker type (start, end, auto-return)

# If open_dialog is set (new dialog open), update tp_dialog_interacted
execute if entity @e[tag=open_dialog,limit=1] run tag @e[tag=tp_dialog_interacted] remove tp_dialog_interacted
execute if entity @e[tag=open_dialog,limit=1] run tag @e[tag=open_dialog,limit=1,sort=nearest] add tp_dialog_interacted
tag @e[tag=open_dialog] remove open_dialog

# Always re-resolve tp_dialog_target (so linking on refresh works)
tag @e[tag=tp_dialog_target] remove tp_dialog_target

# Auto-return markers are marker-only destinations, so use a small marker dialog
execute if entity @e[tag=tp_dialog_interacted,tag=tp_auto_return,limit=1] run function zbk:build_kit/management/teleporter/dialogs/open_auto_return_dialog
execute if entity @e[tag=tp_dialog_interacted,tag=tp_auto_return,limit=1] run return 1

# If interacted marker is a start marker, tag it directly
execute if entity @e[tag=tp_dialog_interacted,tag=tp_start,limit=1] run tag @e[tag=tp_dialog_interacted,tag=tp_start,limit=1] add tp_dialog_target

# If end marker, find linked start via teleporter_id
execute if entity @e[tag=tp_dialog_interacted,tag=!tp_start,limit=1] store result score #resolve_tp_id global run scoreboard players get @e[tag=tp_dialog_interacted,limit=1] teleporter_id
execute if entity @e[tag=tp_dialog_interacted,tag=!tp_start,limit=1] as @e[type=marker,tag=teleporter,tag=tp_start] if score @s teleporter_id = #resolve_tp_id global if score #resolve_tp_id global matches 1.. run tag @s add tp_dialog_target

# Warn if end marker is not linked
execute if entity @e[tag=tp_dialog_interacted,tag=!tp_start,limit=1] unless entity @e[tag=tp_dialog_target] run tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"Warning: This marker is not linked! Assign a Link ID to connect it to a Start marker.","color":"red"}]

# Read current values from tp_dialog_target (start marker)
scoreboard players set #current_price global 750
execute if entity @e[tag=tp_dialog_target,limit=1] store result score #current_price global run data get entity @e[tag=tp_dialog_target,limit=1] data.name
execute if score #current_price global matches 0 run scoreboard players set #current_price global 750

scoreboard players set #current_id global 0
execute if entity @e[tag=tp_dialog_target,limit=1] store result score #current_id global run scoreboard players get @e[tag=tp_dialog_target,limit=1] teleporter_id
execute unless entity @e[tag=tp_dialog_target] if entity @e[tag=tp_dialog_interacted,limit=1] store result score #current_id global run scoreboard players get @e[tag=tp_dialog_interacted,limit=1] teleporter_id

scoreboard players set #current_cooldown global 30
execute if entity @e[tag=tp_dialog_target,limit=1] store result score #current_cooldown global run data get entity @e[tag=tp_dialog_target,limit=1] data.cooldown
execute if score #current_cooldown global matches 0 run scoreboard players set #current_cooldown global 30

scoreboard players set #current_duration global 3
execute if entity @e[tag=tp_dialog_target,limit=1] store result score #current_duration global run data get entity @e[tag=tp_dialog_target,limit=1] data.duration
execute if score #current_duration global matches 0 run scoreboard players set #current_duration global 3

scoreboard players set #current_radius global 3
execute if entity @e[tag=tp_dialog_target,limit=1] store result score #current_radius global run data get entity @e[tag=tp_dialog_target,limit=1] data.radius
execute if score #current_radius global matches 0 run scoreboard players set #current_radius global 3

# Get recharge_delay (default 2 = 2 seconds)
scoreboard players set #current_recharge_delay global 2
execute if entity @e[tag=tp_dialog_target,limit=1] store result score #current_recharge_delay global run data get entity @e[tag=tp_dialog_target,limit=1] data.recharge_delay
execute if score #current_recharge_delay global matches 0 run scoreboard players set #current_recharge_delay global 2

# Get mode (default 1 = two-way). data.two_way is read first for old markers, then data.mode overrides it.
scoreboard players set #current_mode global 1
execute if entity @e[tag=tp_dialog_target,limit=1] if data entity @e[tag=tp_dialog_target,limit=1] data.two_way store result score #current_mode global run data get entity @e[tag=tp_dialog_target,limit=1] data.two_way
execute if entity @e[tag=tp_dialog_target,limit=1] if data entity @e[tag=tp_dialog_target,limit=1] data.mode store result score #current_mode global run data get entity @e[tag=tp_dialog_target,limit=1] data.mode
execute if score #current_mode global matches ..-1 run scoreboard players set #current_mode global 0
execute if score #current_mode global matches 3.. run scoreboard players set #current_mode global 2

# Get auto_return_timer (default 30 = 30 seconds)
scoreboard players set #current_auto_return_timer global 30
execute if entity @e[tag=tp_dialog_target,limit=1] store result score #current_auto_return_timer global run data get entity @e[tag=tp_dialog_target,limit=1] data.auto_return_timer
execute if score #current_auto_return_timer global matches 0 run scoreboard players set #current_auto_return_timer global 30
execute if score #current_auto_return_timer global matches 1..5 run scoreboard players set #current_auto_return_timer global 6

# Scan all teleporter markers for used IDs
function zbk:build_kit/management/teleporter/scan_used_ids

# Build mode display text
data modify storage zbk:temp mode_text set value "Two-Way"
execute if score #current_mode global matches 0 run data modify storage zbk:temp mode_text set value "One-Way"
execute if score #current_mode global matches 2 run data modify storage zbk:temp mode_text set value "Auto-Return"

# Store data for macro function
data modify storage zbk:temp teleporter_dialog set value {current_price:750,current_id:0,used_ids:"None",current_cooldown:30,current_duration:3,current_radius:3,current_recharge_delay:2,current_mode:1,current_auto_return_timer:30,mode_text:"Two-Way"}
execute store result storage zbk:temp teleporter_dialog.current_price int 1 run scoreboard players get #current_price global
execute store result storage zbk:temp teleporter_dialog.current_id int 1 run scoreboard players get #current_id global
execute store result storage zbk:temp teleporter_dialog.current_cooldown int 1 run scoreboard players get #current_cooldown global
execute store result storage zbk:temp teleporter_dialog.current_duration int 1 run scoreboard players get #current_duration global
execute store result storage zbk:temp teleporter_dialog.current_radius int 1 run scoreboard players get #current_radius global
execute store result storage zbk:temp teleporter_dialog.current_recharge_delay int 1 run scoreboard players get #current_recharge_delay global
execute store result storage zbk:temp teleporter_dialog.current_mode int 1 run scoreboard players get #current_mode global
execute store result storage zbk:temp teleporter_dialog.current_auto_return_timer int 1 run scoreboard players get #current_auto_return_timer global
data modify storage zbk:temp teleporter_dialog.used_ids set from storage zbk:temp used_ids_string
data modify storage zbk:temp teleporter_dialog.mode_text set from storage zbk:temp mode_text

# Call macro function with storage data
function zbk:build_kit/management/teleporter/dialogs/show_config_dialog with storage zbk:temp teleporter_dialog
