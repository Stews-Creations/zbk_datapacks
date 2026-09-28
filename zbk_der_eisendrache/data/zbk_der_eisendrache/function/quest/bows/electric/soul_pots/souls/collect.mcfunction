# Credit at acceptance, as the dragon does; the traveling orb is cosmetic and cannot lose a saved soul.
$execute if score #$(id) de_es_souls matches 8.. run return 0
$scoreboard players add #$(id) de_es_souls 1
$summon marker ~ ~1 ~ {Tags:["de_es_orb"],data:{id:$(id)}}
$execute if score #$(id) de_es_souls matches 8 at @e[type=marker,tag=de_es_pot,nbt={data:{id:$(id)}},limit=1] run function zbk_der_eisendrache:quest/bows/electric/soul_pots/effects/charged
$execute as @a[tag=debug] if score @s id = #map_killer temp run tellraw @s [{"text":"Soul pot $(id): ","color":"aqua"},{"score":{"name":"#$(id)","objective":"de_es_souls"}},{"text":"/8"}]
