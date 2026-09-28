execute unless score #active zbk.de matches 1 run return 0
execute unless score #electric de_el_progress matches 2 run return 0
execute unless score @s id = #1 de_bow_owner run return 0
$execute unless score #$(pot) de_es_set matches 1 run return 0
$execute unless score #$(pot) de_es_souls matches 8 run return 0
$execute if score #$(pot) de_ec_used matches 1 run return 0
$execute if score #$(fire) de_ec_fire matches 1 run return 0
$scoreboard players set #$(pot) de_ec_used 1
$scoreboard players set #$(fire) de_ec_fire 1
$scoreboard players set #$(fire) de_el_fire_lit 1
$kill @e[type=marker,tag=de_es_orb,nbt={data:{id:$(pot)}}]
scoreboard players reset @s de_ec_shot
scoreboard players set @s raycast_distance 10001
particle minecraft:flash{color:[0.15,0.55,1.0,1.0]} ~ ~ ~ 0 0 0 0 1 force @a[distance=..256]
$tellraw @s[tag=debug] {"text":"Fire $(fire) electrified; soul pot $(pot) consumed.","color":"aqua"}
execute if score #1 de_ec_fire matches 1 if score #2 de_ec_fire matches 1 if score #3 de_ec_fire matches 1 if score #1 de_ec_used matches 1 if score #2 de_ec_used matches 1 if score #3 de_ec_used matches 1 run function zbk_der_eisendrache:quest/bows/electric/soul_pots/charge/complete
return 1
