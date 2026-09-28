# ===================================
# EXPLOSIVE BARREL - EXPLODE
# ===================================
# Purpose: Barrel explosion - particles, sound, area damage to players/zombies/wolves
# Called as @s = the explosive_barrel marker, at @s = its position

# Prevent double-triggering
execute if entity @s[tag=explosive_barrel_exploded] run return 0
tag @s add explosive_barrel_exploded
scoreboard players set @s barrel_health 0

# Kill displays and interaction entity (but keep the marker for respawning)
# Saved block-display assemblies must lose their passengers before the root.
execute as @e[tag=explosive_barrel_display,distance=..3] on passengers run kill @s
kill @e[tag=explosive_barrel_display,distance=..3]
kill @e[type=minecraft:interaction,tag=explosive_barrel_interaction,distance=..3]

# Explosion visual effects
particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
particle minecraft:explosion ~ ~1 ~ 2 2 2 0.1 20 force
particle minecraft:flame ~ ~1 ~ 2 2 2 0.1 40 force
particle minecraft:large_smoke ~ ~1 ~ 2 2 2 0.1 30 force
playsound zbk:environment.explode_barrel hostile @a ~ ~ ~ 3 0.9

# Damage players in 7 blocks (5 hearts / 10 HP flat damage)
execute as @a[distance=..7] at @s run function zbk:map_elements/explosive_barrel/gameplay/damage_players

# Damage zombies in 7 blocks (200 flat damage, insta-kill if powerup active)
execute as @e[type=zombified_piglin,distance=..7,tag=!immune_explosives] at @s run function zbk:map_elements/explosive_barrel/gameplay/damage_zombies

# Damage wolves in 7 blocks (200 flat damage, insta-kill if powerup active)
execute as @e[type=wolf,distance=..7,tag=!immune_explosives] at @s run function zbk:map_elements/explosive_barrel/gameplay/damage_wolves

function zbk:dispatch/barrel_exploded
