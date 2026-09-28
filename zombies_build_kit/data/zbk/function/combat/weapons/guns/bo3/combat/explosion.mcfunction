# Shared MR6 PaP / XM-53 splash. Covers wolves and bosses as well as normal zombies.
scoreboard players operation #shooter_id stats = #player stats
scoreboard players set #blast_raygun stats 0
scoreboard players set #blast_crawlers stats 0
scoreboard players set #blast_kill_bonus stats 100
execute store result storage zbk:temp blast.radius int 1 run scoreboard players get #explosive_radius stats
function zbk:combat/weapons/effects/explosive/splash_targets with storage zbk:temp blast
particle minecraft:explosion ~ ~ ~ 0 0 0 0 1
playsound minecraft:entity.generic.explode hostile @a[distance=..24] ~ ~ ~ 0.7 1.2
tag @e[tag=explosion_direct_hit] remove explosion_direct_hit
tag @a remove explosion_leg_shot
