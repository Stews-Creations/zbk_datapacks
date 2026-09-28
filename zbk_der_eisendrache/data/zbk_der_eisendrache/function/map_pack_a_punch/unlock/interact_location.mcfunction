# Called as/at the dormant map PaP location marker that was clicked.

execute if score @s map_pap_visited matches 1.. run tellraw @p[distance=..5,limit=1,sort=nearest] [{"text":"[Map Pack-a-Punch] ","color":"light_purple"},{"text":"This location is already linked.","color":"gray"}]
execute if score @s map_pap_visited matches 1.. run return 0

scoreboard players set @s map_pap_visited 1
scoreboard players add #map_pap_visited_count map_pap 1
execute unless score #map_pap_required_locations map_pap matches 1.. run scoreboard players set #map_pap_required_locations map_pap 3
kill @e[type=text_display,distance=..2,tag=map_pack_a_punch_link_text]

function zbk_der_eisendrache:map_pack_a_punch/unlock/start_debris

tellraw @a[tag=debug] [{"text":"[Map Pack-a-Punch] ","color":"light_purple"},{"text":"Location linked: ","color":"gray"},{"score":{"name":"#map_pap_visited_count","objective":"map_pap"},"color":"aqua","bold":true},{"text":"/","color":"gray"},{"score":{"name":"#map_pap_required_locations","objective":"map_pap"},"color":"aqua","bold":true}]

execute if score #map_pap_visited_count map_pap >= #map_pap_required_locations map_pap run tag @s add map_pap_complete_after_debris
execute if score #map_pap_visited_count map_pap matches 3.. run tag @s add map_pap_complete_after_debris
execute if entity @s[tag=map_pap_complete_after_debris] run return 0
