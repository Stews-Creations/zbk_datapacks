# === BUY DOOR ===
# Called when a player attempts to purchase a door
# Executed as the player, at the nearest door marker

# Store the door price from the nearest marker's data.name
execute store result score @s door_price run data get entity @e[type=marker,tag=door,tag=!purchased,sort=nearest,limit=1] data.name 1

# Check if player has enough points
execute unless score @s player_points >= @s door_price run tellraw @s [{"text":"[DOOR] ","color":"red"},{"text":"Not enough points! Need ","color":"gold"},{"score":{"name":"@s","objective":"door_price"},"color":"yellow"},{"text":" points.","color":"gold"}]
execute unless score @s player_points >= @s door_price run return fail

# Subtract points from player
scoreboard players operation @s player_points -= @s door_price

# Track door purchase stat
scoreboard players add @s stat_doors 1

# Play purchase sounds
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 2
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 1.5

# Debug message for door purchase
execute as @a[tag=debug,scores={debug_level=3..}] run tellraw @s [{"text":"[DOOR] ","color":"aqua"},{"selector":"@s","color":"yellow"},{"text":" purchased door for ","color":"green"},{"score":{"name":"@s","objective":"door_price"},"color":"gold"},{"text":" points","color":"green"}]

# Run effects and animation at the nearest door, then tag it as purchased
execute as @e[type=marker,tag=door,tag=!purchased,sort=nearest,limit=1] at @s run function zbk:map_elements/door/purchasable/management/open
