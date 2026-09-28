# === BUY ELECTRIC TRAP ===
# Called when a player clicks the sign
# Auto-finds nearest 2 corner markers and activates trap

# Block purchase if player is downed
execute if entity @s[team=downed] run return fail

# Check if power is on
execute if score #power power matches 0 run tellraw @s [{"text":"[TRAP] ","color":"red"},{"text":"Power must be on","color":"gold"}]
execute if score #power power matches 0 run return fail

# Find the 2 nearest corner markers and tag them temporarily
execute store result score #corner_count trap_cost if entity @e[type=marker,tag=trap_corner,distance=..20]
execute if score #corner_count trap_cost matches ..1 run tellraw @s [{"text":"[TRAP] ","color":"red"},{"text":"Need 2 corner markers within 20 blocks!","color":"gold"}]
execute if score #corner_count trap_cost matches ..1 run return fail

# Tag the 2 nearest corners as "this_trap" to check their specific state
tag @e[type=marker,tag=trap_corner,distance=..20,limit=2,sort=nearest] add this_trap

# Check if THIS specific trap (the 2 tagged corners) is already active or on cooldown
execute if entity @e[type=marker,tag=this_trap,tag=trap_active,limit=1] run return run function zombies:map_elements/traps/electric/purchasing/fail_active
execute if entity @e[type=marker,tag=this_trap,tag=trap_cooldown,limit=1] run return run function zombies:map_elements/traps/electric/purchasing/fail_cooldown

# Get cost from nearest trap corner (default 1000 if not set)
execute store result score @s trap_cost run data get entity @e[type=marker,tag=trap_corner,distance=..20,limit=1,sort=nearest] data.cost
execute unless score @s trap_cost matches 1.. run scoreboard players set @s trap_cost 1000

# Check if player has enough points
execute unless score @s player_points >= @s trap_cost run tellraw @s [{"text":"[TRAP] ","color":"red"},{"text":"Not enough points! Need ","color":"gold"},{"score":{"name":"@s","objective":"trap_cost"},"color":"yellow"},{"text":" points.","color":"gold"}]
execute unless score @s player_points >= @s trap_cost run tag @e[tag=this_trap] remove this_trap
execute unless score @s player_points >= @s trap_cost run return fail

# Subtract points from player
scoreboard players operation @s player_points -= @s trap_cost

# Debug message
execute as @a[tag=debug,scores={debug_level=3..}] run tellraw @s [{"text":"[TRAP] ","color":"aqua"},{"text":"Electric Trap purchased for ","color":"green"},{"score":{"name":"@s","objective":"trap_cost"},"color":"gold"},{"text":" points","color":"green"}]

# Play purchase sounds
playsound zombies:traps.amb_sparks_r master @a ~ ~ ~ 1 1
playsound minecraft:entity.lightning_bolt.thunder master @a ~ ~ ~ 0.5 1.5

# Activate the tagged trap corners
execute as @e[type=marker,tag=this_trap] run tag @s add trap_active
# Set timer from sign duration (seconds * 20 = ticks), fallback 600 ticks
execute store result score #trap_dur global run data get entity @e[type=marker,tag=trap_sign,distance=..20,limit=1,sort=nearest] data.duration 20
execute unless score #trap_dur global matches 1.. run scoreboard players set #trap_dur global 600
execute as @e[type=marker,tag=this_trap] run scoreboard players operation @s trap_timer = #trap_dur global

# Visual and audio activation effects at both corners
execute as @e[type=marker,tag=this_trap] at @s run particle minecraft:electric_spark ~ ~1 ~ 1.5 1 1.5 0.1 50 force
execute as @e[type=marker,tag=this_trap] at @s run particle minecraft:explosion ~ ~1 ~ 0 0 0 0 1 force
execute as @e[type=marker,tag=this_trap] at @s run playsound minecraft:entity.lightning_bolt.thunder master @a ~ ~ ~ 1 1.2
execute as @e[type=marker,tag=this_trap] at @s run playsound minecraft:block.beacon.activate master @a ~ ~ ~ 0.8 1.5

# Clean up temporary tag
tag @e[tag=this_trap] remove this_trap
