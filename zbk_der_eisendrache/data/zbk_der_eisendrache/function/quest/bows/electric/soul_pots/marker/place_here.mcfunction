$kill @e[type=marker,tag=de_es_pot,nbt={data:{id:$(id)}}]
$kill @e[type=marker,tag=de_es_orb,nbt={data:{id:$(id)}}]
$summon marker ~ ~ ~ {Tags:["de_es_pot"],data:{id:$(id)}}
$scoreboard players set #$(id) de_es_set 1
$scoreboard players add #$(id) de_es_souls 0
$tellraw @s {"text":"Soul pot $(id) marked. It accepts 8 owner kills within 10 blocks after the wall-run step.","color":"aqua"}
