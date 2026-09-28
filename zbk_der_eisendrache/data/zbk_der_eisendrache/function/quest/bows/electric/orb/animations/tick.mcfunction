execute unless score #active zbk.de matches 1 run return run kill @s
execute if score @s de_orb_life matches ..0 run return run kill @s
scoreboard players operation #player stats = @s de_orb_owner
scoreboard players set #de_orb_owner_present stats 0
execute as @a if score @s id = #player stats run scoreboard players set #de_orb_owner_present stats 1
execute if score #de_orb_owner_present stats matches 0 run return run kill @s
execute if entity @a[distance=..3] run function zbk_der_eisendrache:quest/bows/electric/orb/effects/sound

# Compact blue-white electrical ball at the impact point; no real lightning or fire.
particle minecraft:dust{color:[0.2,0.65,1.0],scale:0.65} ~ ~0.35 ~ 0.15 0.15 0.15 0 4 force @a[distance=..48]
particle minecraft:electric_spark ~ ~0.35 ~ 0.22 0.22 0.22 0.025 3 force @a[distance=..48]
scoreboard players operation #de_orb_mod stats = @s de_orb_life
scoreboard players set #de_orb_interval stats 10
scoreboard players operation #de_orb_mod stats %= #de_orb_interval stats
execute if score #de_orb_mod stats matches 0 run function zbk_der_eisendrache:quest/bows/electric/orb/effects/pulse
scoreboard players remove @s de_orb_life 1
execute if score @s de_orb_life matches ..0 run kill @s
