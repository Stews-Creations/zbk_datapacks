execute unless score #active zbk.de matches 1 run return 0
execute unless dimension minecraft:overworld run return 0
execute unless score #electric de_el_progress matches 4 run return 0
execute unless score #phase de_eb_state matches 1 run return 0
execute if score #souls de_eb_souls matches 15.. run return 0
execute unless score #map_killer temp matches 1.. run return 0
execute unless score #map_killer temp = #1 de_bow_owner run return 0
scoreboard players set #de_eb_online temp 0
execute as @a[team=!downed,gamemode=!spectator] if score @s id = #map_killer temp unless items entity @s weapon.mainhand *[custom_data~{mob_immunity_tool:true}] run scoreboard players set #de_eb_online temp 1
execute unless score #de_eb_online temp matches 1 run return 0
execute unless entity @e[type=marker,tag=de_eb_marker,distance=..5] run return 0
scoreboard players add #souls de_eb_souls 1
summon marker ~ ~1 ~ {Tags:["de_eb_orb"]}
execute if score #souls de_eb_souls matches 15 run function zbk_der_eisendrache:quest/bows/electric/ritual_box/management/charged
execute as @a[tag=debug] if score @s id = #map_killer temp run tellraw @s [{"text":"Electric ritual box: ","color":"aqua"},{"score":{"name":"#souls","objective":"de_eb_souls"}},{"text":"/15"}]
