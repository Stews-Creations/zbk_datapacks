# Each marker is its own center, lifetime, rotation and owner.
execute unless score #active zbk.de matches 1 run return run function zbk_der_eisendrache:quest/bows/electric/storm/management/remove
execute if score @s de_storm_life matches ..0 run return run function zbk_der_eisendrache:quest/bows/electric/storm/management/remove
scoreboard players operation #player stats = @s de_storm_owner
scoreboard players set #de_storm_owner_present stats 0
execute as @a if score @s id = #player stats run scoreboard players set #de_storm_owner_present stats 1
execute if score #de_storm_owner_present stats matches 0 run return run function zbk_der_eisendrache:quest/bows/electric/storm/management/remove

# Orbit only this marker's paired breeze around the fixed damage center.
scoreboard players operation #current de_storm_link = @s de_storm_link
scoreboard players operation #de_breeze_yaw stats = @s de_storm_life
scoreboard players set #de_breeze_step stats -6
scoreboard players operation #de_breeze_yaw stats *= #de_breeze_step stats
execute store result storage zbk:temp electric_storm_yaw.yaw int 1 run scoreboard players get #de_breeze_yaw stats
function zbk_der_eisendrache:quest/bows/electric/storm/animations/orbit with storage zbk:temp electric_storm_yaw

# Blue-white spiral and wind. Visual lightning never creates damaging bolt entities.
tp @s ~ ~ ~ ~18 0
execute rotated as @s run particle minecraft:electric_spark ^ ^0.2 ^1 0.1 0.1 0.1 0.05 2 force
execute rotated as @s run particle minecraft:electric_spark ^-1 ^1.2 ^ 0.1 0.1 0.1 0.05 2 force
execute rotated as @s run particle minecraft:electric_spark ^ ^2.4 ^-1.5 0.1 0.1 0.1 0.05 2 force
execute rotated as @s run particle minecraft:dust{color:[0.25,0.6,1.0],scale:1.3} ^2 ^3.6 ^ 0.2 0.2 0.2 0 3 force
particle minecraft:cloud ~ ~0.2 ~ 3 0.1 3 0.015 3 normal
scoreboard players operation #de_storm_mod stats = @s de_storm_life
scoreboard players set #de_storm_interval stats 10
scoreboard players operation #de_storm_mod stats %= #de_storm_interval stats
execute if score #de_storm_mod stats matches 0 run function zbk_der_eisendrache:quest/bows/electric/storm/effects/pulse
scoreboard players remove @s de_storm_life 1
execute if score @s de_storm_life matches ..0 run function zbk_der_eisendrache:quest/bows/electric/storm/management/remove
