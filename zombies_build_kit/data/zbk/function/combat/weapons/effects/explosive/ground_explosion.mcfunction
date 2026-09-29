# Ground blast: surviving adults may lose their legs after damage.
scoreboard players set #blast_raygun stats 0
execute if score #gun_id stats matches 7 run scoreboard players set #blast_raygun stats 1
scoreboard players operation #shooter_id stats = #player stats
scoreboard players set #blast_crawlers stats 1
scoreboard players set #blast_kill_bonus stats 100
execute store result storage zbk:temp blast.radius int 1 run scoreboard players get #explosive_radius stats
function zbk:combat/weapons/effects/explosive/targets/splash_targets with storage zbk:temp blast
function zbk:combat/weapons/events/extension/effects/explosive/ground_explosion
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
execute if score #gun_id stats matches 5 run playsound minecraft:entity.generic.explode master @a[distance=..20] ~ ~ ~ 0.6 1.4
