tag @e[type=marker,tag=de_ec_available] remove de_ec_available
execute as @e[type=marker,tag=de_es_pot,distance=..3] run function zbk_der_eisendrache:quest/bows/electric/soul_pots/charge/available with entity @s data
execute unless entity @e[type=marker,tag=de_ec_available,distance=..3] run return 0
execute store result score @s de_ec_pot run data get entity @e[type=marker,tag=de_ec_available,distance=..3,sort=nearest,limit=1] data.id
tag @e[type=marker,tag=de_ec_available] remove de_ec_available
scoreboard players set @s de_ec_audio 0
tellraw @s[tag=debug] {"text":"Electric shot charged. Release at an unelectrified fire; a miss requires returning to a pot.","color":"aqua"}
