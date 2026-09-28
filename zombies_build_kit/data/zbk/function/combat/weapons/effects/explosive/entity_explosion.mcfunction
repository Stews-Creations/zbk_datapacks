# Splash excludes the direct victim. Only leg-height impacts enable conversion.
scoreboard players set #blast_raygun stats 0
execute if score #gun_id stats matches 7 run scoreboard players set #blast_raygun stats 1
scoreboard players operation #shooter_id stats = #player stats
scoreboard players set #blast_crawlers stats 0
execute if entity @a[tag=explosion_leg_shot] run scoreboard players set #blast_crawlers stats 1
scoreboard players set #blast_kill_bonus stats 100
execute store result storage zbk:temp blast.radius int 1 run scoreboard players get #explosive_radius stats
function zbk:combat/weapons/effects/explosive/splash_targets with storage zbk:temp blast
tag @e[tag=explosion_direct_hit] remove explosion_direct_hit
tag @a remove explosion_leg_shot
