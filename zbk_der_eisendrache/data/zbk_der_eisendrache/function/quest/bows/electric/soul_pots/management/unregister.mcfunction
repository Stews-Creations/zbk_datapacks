execute unless score #active zbk.de matches 1 run return 0
execute unless dimension minecraft:overworld run return 0
$scoreboard players set #de_es_id temp $(id)
execute unless score #de_es_id temp matches 1..3 run return 0
$execute if entity @e[type=marker,tag=de_es_pot,nbt={data:{id:$(id)}}] run return run tellraw @s {"text":"Marker still exists; use delete instead.","color":"yellow"}
$scoreboard players reset #$(id) de_es_set
$kill @e[type=marker,tag=de_es_orb,nbt={data:{id:$(id)}}]
$tellraw @s {"text":"Soul pot $(id) unregistered; saved charge retained. Only use after manual marker deletion, not when its chunk is unloaded.","color":"yellow"}
