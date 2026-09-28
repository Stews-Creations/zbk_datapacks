# Shared credited-kill gate; execution position is the dead zombie or its native soul drop.
execute unless score #electric de_el_progress matches 2 run return 0
execute unless score #map_killer temp matches 1.. run return 0
execute unless score #map_killer temp = #1 de_bow_owner run return 0
scoreboard players set #de_es_owner_online temp 0
execute as @a[team=!downed,gamemode=!spectator] if score @s id = #map_killer temp unless items entity @s weapon.mainhand *[custom_data~{mob_immunity_tool:true}] run scoreboard players set #de_es_owner_online temp 1
execute unless score #de_es_owner_online temp matches 1 run return 0
tag @e[type=marker,tag=de_es_candidate] remove de_es_candidate
execute as @e[type=marker,tag=de_es_pot,distance=..10] run function zbk_der_eisendrache:quest/bows/electric/soul_pots/validation/candidate with entity @s data
execute unless entity @e[type=marker,tag=de_es_candidate,distance=..10] run return 0
function zbk_der_eisendrache:quest/bows/electric/soul_pots/souls/collect with entity @e[type=marker,tag=de_es_candidate,distance=..10,sort=nearest,limit=1] data
tag @e[type=marker,tag=de_es_candidate] remove de_es_candidate
