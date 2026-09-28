$execute if score #$(id) de_ec_used matches 1 run return 0
$execute unless score #$(id) de_es_souls matches 8.. run particle minecraft:electric_spark ~ ~0.1 ~ 0.12 0.18 0.12 0.01 2 force @a[distance=..48]
$execute if score #$(id) de_es_souls matches 8.. run particle minecraft:electric_spark ~ ~0.15 ~ 0.18 0.2 0.18 0.02 5 force @a[distance=..48]
$execute if score #$(id) de_es_souls matches 8.. run particle minecraft:dust{color:[0.35,0.8,1.0],scale:0.8} ~ ~0.1 ~ 0.1 0.12 0.1 0 8 force @a[distance=..48]
