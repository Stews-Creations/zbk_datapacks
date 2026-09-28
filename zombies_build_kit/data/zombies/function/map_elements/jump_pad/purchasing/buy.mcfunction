# ===================================
# JUMP PAD - BUY/PURCHASE
# ===================================
# Called when a player attempts to purchase a jump pad
# Executed as the player, at the nearest jump pad marker
# ===================================

# Check if jump pad is on cooldown (purchased)
execute at @s if entity @e[type=marker,tag=jump_pad,tag=jp_start,tag=purchased,distance=..1.75] run tellraw @s [{"text":"[JUMP PAD] ","color":"red"},{"text":"On Cooldown","color":"gold"}]
execute at @s if entity @e[type=marker,tag=jump_pad,tag=jp_start,tag=purchased,distance=..1.75] run return fail

# Check if player is within 1.75 blocks of a jump pad start marker
execute at @s unless entity @e[type=marker,tag=jump_pad,tag=jp_start,distance=..1.75] run tellraw @s [{"text":"[JUMP PAD] ","color":"red"},{"text":"Must be inside area","color":"gold"}]
execute at @s unless entity @e[type=marker,tag=jump_pad,tag=jp_start,distance=..1.75] run return fail

# Check if jump pad is locked (must reach destination first to unlock)
execute at @s if entity @e[type=marker,tag=jump_pad,tag=jp_start,tag=jp_locked,distance=..1.75] run tellraw @s [{"text":"[JUMP PAD] ","color":"red"},{"text":"Jump pad is locked! Reach the destination first.","color":"gold"}]
execute at @s if entity @e[type=marker,tag=jump_pad,tag=jp_start,tag=jp_locked,distance=..1.75] run playsound zombies:jump_pads.landing_pad_activation_required master @a ~ ~ ~ 1 1
execute at @s if entity @e[type=marker,tag=jump_pad,tag=jp_start,tag=jp_locked,distance=..1.75] run return fail

# Check if jump pad is linked (has valid ID > 0)
execute store result score #check_jp_id jump_pad_id run scoreboard players get @e[type=marker,tag=jump_pad,tag=jp_start,tag=!purchased,distance=..1.75,sort=nearest,limit=1] jump_pad_id
execute unless score #check_jp_id jump_pad_id matches 1.. run tellraw @s [{"text":"[JUMP PAD] ","color":"red"},{"text":"Jump Pad is not linked! Use build manager to link markers.","color":"gold"}]
execute unless score #check_jp_id jump_pad_id matches 1.. run return fail


function zbk:dispatch/before_jump_pad_purchase
execute if data storage zbk:events result{blocked:1b} run return 0

# Store the jump pad price from the nearest marker's data.name
execute store result score @s jump_pad_price run data get entity @e[type=marker,tag=jump_pad,tag=jp_start,tag=!purchased,distance=..1.75,sort=nearest,limit=1] data.name 1

# Check if player has enough points
execute unless score @s player_points >= @s jump_pad_price run tellraw @s [{"text":"[JUMP PAD] ","color":"red"},{"text":"Not enough points","color":"gold"}]
execute unless score @s player_points >= @s jump_pad_price run return fail

# Subtract points from player
scoreboard players operation @s player_points -= @s jump_pad_price

# Debug message
function zombies:debug/info {f:"JUMP",m:"Jump pad purchased"}

# Show "Resetting" on the text display
execute as @e[type=text_display,tag=jump_pad_text_display,sort=nearest,limit=1] run data modify entity @s text set value [{"text":"Resetting","color":"red","bold":true}]

# Set launch window timer to 40 ticks (2 seconds)
execute as @e[type=marker,tag=jump_pad,tag=jp_start,tag=!purchased,sort=nearest,limit=1] run scoreboard players set @s jump_pad_launch_timer 40

# Force launch the purchaser immediately
function zombies:map_elements/jump_pad/management/start

# Note: Cooldown will be set when launch timer expires (handled in on_tick)
