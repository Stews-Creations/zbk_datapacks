scoreboard players add #fx de_eb_time 1
execute if score #fx de_eb_time matches 4.. run scoreboard players set #fx de_eb_time 0
execute if score #phase de_eb_state matches 1 if score #fx de_eb_time matches 0 run particle minecraft:electric_spark ~ ~0.7 ~ 0.3 0.4 0.3 0.01 2 force @a[distance=..48]
execute if score #phase de_eb_state matches 2 if score #fx de_eb_time matches 0 run function zbk_der_eisendrache:quest/bows/electric/ritual_box/effects/charged
execute unless score #phase de_eb_state matches 3 run return 0
scoreboard players add #clock de_eb_time 1
execute if score #fx de_eb_time matches 0 run function zbk_der_eisendrache:quest/bows/electric/ritual_box/effects/beam
execute if score #clock de_eb_time matches 100.. run function zbk_der_eisendrache:quest/bows/electric/ritual_box/management/ready
