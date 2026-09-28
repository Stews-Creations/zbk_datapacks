# ===================================
# TELEPORTER - EXECUTE FORWARD TELEPORT
# ===================================
# Purpose: Teleport all players within radius from start to end
# Executed as the start marker, at the start marker
# ===================================

# Get the teleporter ID
execute store result score #active_tp_id teleporter_id run scoreboard players get @s teleporter_id

# Find the matching end marker by ID
execute as @e[type=marker,tag=teleporter,tag=tp_end] if score @s teleporter_id = #active_tp_id teleporter_id run tag @s add tp_temp_end

# Check if end marker exists
execute unless entity @e[tag=tp_temp_end] run function zombies:debug/warn {f:"TELE",m:"No linked end marker found!"}
execute unless entity @e[tag=tp_temp_end] run tag @s remove tp_active
execute unless entity @e[tag=tp_temp_end] run return fail

# Get radius from data (default 3)
scoreboard players set #tp_radius teleporter_price 3
execute store result score #tp_radius teleporter_price run data get entity @s data.radius 1

# Read mode (0=one-way, 1=two-way, 2=auto-return)
scoreboard players set #tp_mode teleporter_price 1
execute if data entity @s data.two_way store result score #tp_mode teleporter_price run data get entity @s data.two_way 1
execute if data entity @s data.mode store result score #tp_mode teleporter_price run data get entity @s data.mode 1

# In auto-return mode, remember the players who actually ride this teleport
execute if score #tp_mode teleporter_price matches 2 if score #tp_radius teleporter_price matches ..3 as @a[distance=..3] run tag @s add tp_auto_return_player
execute if score #tp_mode teleporter_price matches 2 if score #tp_radius teleporter_price matches ..3 as @a[distance=..3] run scoreboard players operation @s teleporter_return_id = #active_tp_id teleporter_id
execute if score #tp_mode teleporter_price matches 2 if score #tp_radius teleporter_price matches 4 as @a[distance=..4] run tag @s add tp_auto_return_player
execute if score #tp_mode teleporter_price matches 2 if score #tp_radius teleporter_price matches 4 as @a[distance=..4] run scoreboard players operation @s teleporter_return_id = #active_tp_id teleporter_id
execute if score #tp_mode teleporter_price matches 2 if score #tp_radius teleporter_price matches 5 as @a[distance=..5] run tag @s add tp_auto_return_player
execute if score #tp_mode teleporter_price matches 2 if score #tp_radius teleporter_price matches 5 as @a[distance=..5] run scoreboard players operation @s teleporter_return_id = #active_tp_id teleporter_id
execute if score #tp_mode teleporter_price matches 2 if score #tp_radius teleporter_price matches 6 as @a[distance=..6] run tag @s add tp_auto_return_player
execute if score #tp_mode teleporter_price matches 2 if score #tp_radius teleporter_price matches 6 as @a[distance=..6] run scoreboard players operation @s teleporter_return_id = #active_tp_id teleporter_id
execute if score #tp_mode teleporter_price matches 2 if score #tp_radius teleporter_price matches 7 as @a[distance=..7] run tag @s add tp_auto_return_player
execute if score #tp_mode teleporter_price matches 2 if score #tp_radius teleporter_price matches 7 as @a[distance=..7] run scoreboard players operation @s teleporter_return_id = #active_tp_id teleporter_id
execute if score #tp_mode teleporter_price matches 2 if score #tp_radius teleporter_price matches 8.. as @a[distance=..8] run tag @s add tp_auto_return_player
execute if score #tp_mode teleporter_price matches 2 if score #tp_radius teleporter_price matches 8.. as @a[distance=..8] run scoreboard players operation @s teleporter_return_id = #active_tp_id teleporter_id

# Select the players who will ride this teleport.
execute as @a[tag=tp_forward_target] at @s run function zbk:dispatch/teleporter_arrival
tag @a[tag=tp_forward_target] remove tp_forward_target
execute if score #tp_radius teleporter_price matches ..3 as @a[distance=..3] run tag @s add tp_forward_target
execute if score #tp_radius teleporter_price matches 4 as @a[distance=..4] run tag @s add tp_forward_target
execute if score #tp_radius teleporter_price matches 5 as @a[distance=..5] run tag @s add tp_forward_target
execute if score #tp_radius teleporter_price matches 6 as @a[distance=..6] run tag @s add tp_forward_target
execute if score #tp_radius teleporter_price matches 7 as @a[distance=..7] run tag @s add tp_forward_target
execute if score #tp_radius teleporter_price matches 8.. as @a[distance=..8] run tag @s add tp_forward_target

execute as @a[tag=tp_forward_target] at @e[tag=tp_temp_end,limit=1] run tp @s ~ ~ ~
tag @a[tag=tp_forward_target] remove tp_forward_target

# Ask stranded enemies to re-enter near this destination, except for timed auto-return teleports.
execute unless score #tp_mode teleporter_price matches 2 at @e[tag=tp_temp_end,limit=1] run function zombies:behavior/relocation/create_anchor

# Audio effects at start and end
function zombies:sounds/play/teleporter_success
execute at @e[tag=tp_temp_end,limit=1] run function zombies:sounds/play/teleporter_success

# Start recharge delay timer (sound plays after delay via on_tick)
execute store result score @s teleporter_recharge_delay run data get entity @s data.recharge_delay 20
execute if score @s teleporter_recharge_delay matches 0 run scoreboard players set @s teleporter_recharge_delay 40

# Show "Resetting" on start text display
execute as @e[type=text_display,tag=teleporter_text_display,distance=..2,limit=1] run data modify entity @s text set value [{"text":"Resetting","color":"red","bold":true}]

# If two-way, show "Resetting" on end text display too
execute if score #tp_mode teleporter_price matches 1 at @e[tag=tp_temp_end,limit=1] as @e[type=text_display,tag=teleporter_end_text_display,distance=..2,limit=1] run data modify entity @s text set value [{"text":"Resetting","color":"red","bold":true}]

# Clean up temp tag
tag @e[tag=tp_temp_end] remove tp_temp_end

# Transition from tp_active to tp_purchased (cooldown)
tag @s remove tp_active
tag @s add tp_purchased
scoreboard players reset @s teleporter_duration

# Auto-return mode waits for its custom timer before starting normal cooldown
execute if score #tp_mode teleporter_price matches 2 run tag @s add tp_auto_return_pending
execute if score #tp_mode teleporter_price matches 2 run scoreboard players set @s teleporter_auto_return 600
execute if score #tp_mode teleporter_price matches 2 if data entity @s data.auto_return_timer store result score @s teleporter_auto_return run data get entity @s data.auto_return_timer 20
execute if score #tp_mode teleporter_price matches 2 if score @s teleporter_auto_return matches ..119 run scoreboard players set @s teleporter_auto_return 120

# Read cooldown from data.cooldown (seconds * 20 = ticks), fallback to 600 ticks (30s)
execute unless score #tp_mode teleporter_price matches 2 store result score @s teleporter_cooldown run data get entity @s data.cooldown 20
execute unless score #tp_mode teleporter_price matches 2 if score @s teleporter_cooldown matches 0 run scoreboard players set @s teleporter_cooldown 600

function zombies:debug/info {f:"TELE",m:"Forward teleport executed"}
