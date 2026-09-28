# ===================================
# TELEPORTER - EXECUTE RETURN TELEPORT
# ===================================
# Purpose: Teleport all players within radius from end to start
# Executed as the start marker, at the start marker
# ===================================

# Get the teleporter ID
execute store result score #active_tp_id teleporter_id run scoreboard players get @s teleporter_id

# Find the matching end marker by ID
execute as @e[type=marker,tag=teleporter,tag=tp_end] if score @s teleporter_id = #active_tp_id teleporter_id run tag @s add tp_temp_end

# Check if end marker exists
execute unless entity @e[tag=tp_temp_end] run function zombies:debug/warn {f:"TELE",m:"No linked end marker found for return!"}
execute unless entity @e[tag=tp_temp_end] run tag @s remove tp_active
execute unless entity @e[tag=tp_temp_end] run tag @s remove tp_reverse
execute unless entity @e[tag=tp_temp_end] run return fail

# Get radius from data (default 3)
scoreboard players set #tp_radius teleporter_price 3
execute store result score #tp_radius teleporter_price run data get entity @s data.radius 1

# Tag self (start marker) so we can reference it after changing @s context
tag @s add tp_temp_start

# Teleport all players within radius of END marker to START marker position
execute at @e[tag=tp_temp_end,limit=1] if score #tp_radius teleporter_price matches ..3 as @a[distance=..3] at @e[tag=tp_temp_start,limit=1] run tp @s ~ ~ ~
execute at @e[tag=tp_temp_end,limit=1] if score #tp_radius teleporter_price matches 4 as @a[distance=..4] at @e[tag=tp_temp_start,limit=1] run tp @s ~ ~ ~
execute at @e[tag=tp_temp_end,limit=1] if score #tp_radius teleporter_price matches 5 as @a[distance=..5] at @e[tag=tp_temp_start,limit=1] run tp @s ~ ~ ~
execute at @e[tag=tp_temp_end,limit=1] if score #tp_radius teleporter_price matches 6 as @a[distance=..6] at @e[tag=tp_temp_start,limit=1] run tp @s ~ ~ ~
execute at @e[tag=tp_temp_end,limit=1] if score #tp_radius teleporter_price matches 7 as @a[distance=..7] at @e[tag=tp_temp_start,limit=1] run tp @s ~ ~ ~
execute at @e[tag=tp_temp_end,limit=1] if score #tp_radius teleporter_price matches 8.. as @a[distance=..8] at @e[tag=tp_temp_start,limit=1] run tp @s ~ ~ ~

# Ask stranded enemies to re-enter near the return destination.
execute at @e[tag=tp_temp_start,limit=1] run function zombies:behavior/relocation/create_anchor

# Clean up temp start tag
tag @e[tag=tp_temp_start] remove tp_temp_start

# Audio effects at end and start
execute at @e[tag=tp_temp_end,limit=1] run function zombies:sounds/play/teleporter_success
function zombies:sounds/play/teleporter_success

# Start recharge delay timer (sound plays after delay via on_tick)
execute store result score @s teleporter_recharge_delay run data get entity @s data.recharge_delay 20
execute if score @s teleporter_recharge_delay matches 0 run scoreboard players set @s teleporter_recharge_delay 40

# Show "Resetting" on both text displays
execute as @e[type=text_display,tag=teleporter_text_display,distance=..2,limit=1] run data modify entity @s text set value [{"text":"Resetting","color":"red","bold":true}]
execute at @e[tag=tp_temp_end,limit=1] as @e[type=text_display,tag=teleporter_end_text_display,distance=..2,limit=1] run data modify entity @s text set value [{"text":"Resetting","color":"red","bold":true}]

# Clean up temp tag
tag @e[tag=tp_temp_end] remove tp_temp_end

# Transition to cooldown
tag @s remove tp_active
tag @s remove tp_reverse
tag @s add tp_purchased
scoreboard players reset @s teleporter_duration

# Read cooldown (same cooldown for both directions)
execute store result score @s teleporter_cooldown run data get entity @s data.cooldown 20
execute if score @s teleporter_cooldown matches 0 run scoreboard players set @s teleporter_cooldown 600

function zombies:debug/info {f:"TELE",m:"Return teleport executed"}
