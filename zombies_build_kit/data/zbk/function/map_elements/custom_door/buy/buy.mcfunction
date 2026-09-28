# ===================================
# CUSTOM DOOR - BUY
# ===================================
# Called when a player clicks the sign interaction during gameplay
# Validates points, deducts cost, triggers door open
# #cd_buy_uid is set by interact.mcfunction to the clicked interaction's cd_sign_uid

# Find the sign linked to the clicked interaction (by UID match, not nearest)
execute unless entity @e[type=marker,tag=custom_door_sign,tag=!purchased] run return 0
tag @e[type=marker,tag=custom_door_sign,tag=!purchased] remove cd_buy_target
execute as @e[type=marker,tag=custom_door_sign,tag=!purchased] if score @s cd_sign_uid = #cd_buy_uid global run tag @s add cd_buy_target
execute unless entity @e[tag=cd_buy_target] run return 0

# Check if this is a power door (block purchase until power is on)
execute store result score #cd_buy_link global run scoreboard players get @e[tag=cd_buy_target,limit=1] custom_door_id
scoreboard players set #cd_buy_power global 0
execute if score #cd_buy_link global matches 1.. as @e[type=marker,tag=custom_door_1] if score @s custom_door_id = #cd_buy_link global if score @s custom_door_power matches 1 run scoreboard players set #cd_buy_power global 1
execute if score #cd_buy_power global matches 1 run tellraw @s [{"text":"[DOOR] ","color":"red"},{"text":"This door requires power!","color":"gold"}]
execute if score #cd_buy_power global matches 1 run return 0

# Store sign price
execute store result score @s door_price run data get entity @e[tag=cd_buy_target,limit=1] data.name 1

# Check if price is 0 (not configured)
execute if score @s door_price matches 0 run tellraw @s [{"text":"[DOOR] ","color":"red"},{"text":"This door has no price set!","color":"gold"}]
execute if score @s door_price matches 0 run return 0

# Check if player has enough points
execute unless score @s player_points >= @s door_price run tellraw @s [{"text":"[DOOR] ","color":"red"},{"text":"Not enough points! Need ","color":"gold"},{"score":{"name":"@s","objective":"door_price"},"color":"yellow"},{"text":" points.","color":"gold"}]
execute unless score @s player_points >= @s door_price run return 0

# Subtract points
scoreboard players operation @s player_points -= @s door_price

# Track door purchase stat
scoreboard players add @s stat_doors 1

# Purchase sounds
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 2
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 1.5

# Debug message
execute as @a[tag=debug,scores={debug_level=3..}] run tellraw @s [{"text":"[DOOR] ","color":"aqua"},{"selector":"@s","color":"yellow"},{"text":" purchased custom door for ","color":"green"},{"score":{"name":"@s","objective":"door_price"},"color":"gold"},{"text":" points","color":"green"}]

# Execute open on the sign marker
execute as @e[tag=cd_buy_target] at @s run function zbk:map_elements/custom_door/buy/open

# Cleanup
tag @e[tag=cd_buy_target] remove cd_buy_target
