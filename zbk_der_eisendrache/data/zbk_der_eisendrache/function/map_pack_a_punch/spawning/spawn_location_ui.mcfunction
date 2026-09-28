# Spawn dormant location interaction. Called as/at a map_pack_a_punch_location marker.
# The visible cue is the link label plus on_tick link particles.

kill @e[type=interaction,distance=..2,tag=map_pack_a_punch_ui]
kill @e[type=item_display,distance=..2,tag=map_pack_a_punch_ui]
kill @e[type=text_display,distance=..2,tag=map_pack_a_punch_ui]

execute unless score @s map_pap_visited matches 1.. run function zbk_der_eisendrache:map_pack_a_punch/structures/place

execute if entity @s[tag=map_pap_south] run summon minecraft:interaction ~ ~0.45 ~0.25 {width:2.0f,height:1.5f,response:true,Tags:["map_pack_a_punch_interaction","map_pack_a_punch_ui"]}
execute if entity @s[tag=map_pap_west] run summon minecraft:interaction ~-0.25 ~0.45 ~ {width:2.0f,height:1.5f,response:true,Tags:["map_pack_a_punch_interaction","map_pack_a_punch_ui"]}
execute if entity @s[tag=map_pap_north] run summon minecraft:interaction ~ ~0.45 ~-0.25 {width:2.0f,height:1.5f,response:true,Tags:["map_pack_a_punch_interaction","map_pack_a_punch_ui"]}
execute if entity @s[tag=map_pap_east] run summon minecraft:interaction ~0.25 ~0.45 ~ {width:2.0f,height:1.5f,response:true,Tags:["map_pack_a_punch_interaction","map_pack_a_punch_ui"]}
execute unless score @s map_pap_visited matches 1.. if entity @s[tag=map_pap_south] run summon minecraft:text_display ~ ~1.60 ~ {view_range:0.5f,Tags:["map_pack_a_punch_ui","map_pack_a_punch_link_text"],billboard:"center",background:0,shadow:1b,brightness:{block:15,sky:15},transformation:{scale:[1.25f,1.25f,1.25f]},text:[{"text":"Link Pack-a-Punch","color":"light_purple","bold":true}]}
execute unless score @s map_pap_visited matches 1.. if entity @s[tag=map_pap_west] run summon minecraft:text_display ~ ~1.60 ~ {view_range:0.5f,Tags:["map_pack_a_punch_ui","map_pack_a_punch_link_text"],billboard:"center",background:0,shadow:1b,brightness:{block:15,sky:15},transformation:{scale:[1.25f,1.25f,1.25f]},text:[{"text":"Link Pack-a-Punch","color":"light_purple","bold":true}]}
execute unless score @s map_pap_visited matches 1.. if entity @s[tag=map_pap_north] run summon minecraft:text_display ~ ~1.60 ~ {view_range:0.5f,Tags:["map_pack_a_punch_ui","map_pack_a_punch_link_text"],billboard:"center",background:0,shadow:1b,brightness:{block:15,sky:15},transformation:{scale:[1.25f,1.25f,1.25f]},text:[{"text":"Link Pack-a-Punch","color":"light_purple","bold":true}]}
execute unless score @s map_pap_visited matches 1.. if entity @s[tag=map_pap_east] run summon minecraft:text_display ~ ~1.60 ~ {view_range:0.5f,Tags:["map_pack_a_punch_ui","map_pack_a_punch_link_text"],billboard:"center",background:0,shadow:1b,brightness:{block:15,sky:15},transformation:{scale:[1.25f,1.25f,1.25f]},text:[{"text":"Link Pack-a-Punch","color":"light_purple","bold":true}]}
