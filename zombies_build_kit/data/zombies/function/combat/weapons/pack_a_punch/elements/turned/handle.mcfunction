# Turned element — run as @s = the hit entity.
# Returns 1 if conversion happened (caller will skip damage).

# Skip non-piglin and already-turned targets
execute unless entity @s[type=zombified_piglin,tag=!turned_zombie] run return 0
execute if entity @s[tag=immune_elements] run return 0

# Cap: max 2 turned out at once
scoreboard players set #turned_count temp 0
execute as @e[tag=turned_zombie] run scoreboard players add #turned_count temp 1
execute if score #turned_count temp matches 2.. run return 0

# 25% per-bullet roll
execute store result score #turned_roll temp run random value 1..4
execute unless score #turned_roll temp matches 1 run return 0

# --- Convert ---
# Release temporary shield-owner routing before this ally resumes native attacks.
function zombies:combat/weapons/special_equipment/rocket_shield/protection/restore_mob
tag @s add turned_zombie
data modify entity @s Invulnerable set value 1b
attribute @s movement_speed base set 0.30

# Scale attack damage so turned piglins always 2-hit wave zombies.
# Wave zombie health = round + 20 (see waves/management/calculations/calculate_health). dmg = ceil(health / 2)
scoreboard players operation #turned_dmg temp = #global wave.health
scoreboard players add #turned_dmg temp 1
scoreboard players operation #turned_dmg temp /= #2 stats
execute store result storage zombies:temp dmg int 1 run scoreboard players get #turned_dmg temp
function zombies:combat/weapons/pack_a_punch/elements/turned/set_damage with storage zombies:temp

# Wave piglins have mob_factor:0.1 (can't reach other mobs) — restore vanilla mob reach
data modify entity @s equipment.mainhand.components."minecraft:attack_range" set value {max_reach:3.0,mob_factor:1.0}
data modify entity @s CustomName set value {text:"Turned",color:"green",bold:1b}
data modify entity @s CustomNameVisible set value 1b

# 20-second expiry timer
execute store result score @s turned_expire run time query gametime
scoreboard players add @s turned_expire 400

# Initial anger toward nearest non-turned wave enemy (30s lock)
function zombies:combat/weapons/pack_a_punch/elements/turned/set_anger {delta:600}

playsound minecraft:entity.zombie.ambient hostile @a ~ ~ ~ 1 0.5

return 1
