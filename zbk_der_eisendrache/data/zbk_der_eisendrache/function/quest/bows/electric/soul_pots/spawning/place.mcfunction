# Aim at a real empty or planted flower pot within 8 blocks. ID 1, 2 or 3.
execute unless score #active zbk.de matches 1 run return run tellraw @s {"text":"Select Der Eisendrache before placing soul pots.","color":"yellow"}
execute unless dimension minecraft:overworld run return 0
$scoreboard players set #de_es_id temp $(id)
execute unless score #de_es_id temp matches 1..3 run return run tellraw @s {"text":"Use soul pot id 1, 2 or 3.","color":"yellow"}
$execute if score #$(id) de_es_set matches 1 unless entity @e[type=marker,tag=de_es_pot,nbt={data:{id:$(id)}}] run return run tellraw @s {"text":"Load the old soul pot before moving it. Use unregister only if its marker was manually deleted.","color":"yellow"}
$data modify storage zombies:de_soul_pots placement set value {id:$(id)}
scoreboard players set #de_es_ray temp 0
execute at @s anchored eyes positioned ^ ^ ^ anchored feet run function zbk_der_eisendrache:quest/bows/electric/soul_pots/marker/look
