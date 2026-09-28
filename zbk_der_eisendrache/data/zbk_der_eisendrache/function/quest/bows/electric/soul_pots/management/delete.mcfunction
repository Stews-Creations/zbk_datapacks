execute unless score #active zbk.de matches 1 run return 0
execute unless dimension minecraft:overworld run return 0
$execute unless entity @e[type=marker,tag=de_es_pot,nbt={data:{id:$(id)}}] run return run tellraw @s {"text":"Load this soul pot before deleting its marker.","color":"yellow"}
$kill @e[type=marker,tag=de_es_pot,nbt={data:{id:$(id)}}]
$kill @e[type=marker,tag=de_es_orb,nbt={data:{id:$(id)}}]
$scoreboard players reset #$(id) de_es_set
$scoreboard players reset #$(id) de_es_souls
$tellraw @s {"text":"Soul pot $(id) marker and charge removed. The real pot is unchanged.","color":"green"}
