# Place the single Der Eisendrache Pack-a-Punch anchor structure.
# Called as/at a map_pack_a_punch_location marker.

execute as @e[type=item_display,distance=..8,tag=de_pack_debris] on passengers run kill @s
execute as @e[type=item_display,distance=..8,tag=de_pack_debris_anim] on passengers run kill @s
kill @e[distance=..8,tag=de_pack_debris]
kill @e[distance=..8,tag=de_pack_debris_anim]
kill @e[type=marker,distance=..8,tag=de_pack_spawn,tag=!de_pack_a_punch_location]

execute if entity @s[tag=map_pap_south] run place template minecraft:zombies/de_pack_a_punch ~-3 ~ ~-1 none
execute if entity @s[tag=map_pap_west] run place template minecraft:zombies/de_pack_a_punch ~1 ~ ~-3 clockwise_90
execute if entity @s[tag=map_pap_north] run place template minecraft:zombies/de_pack_a_punch ~3 ~ ~1 180
execute if entity @s[tag=map_pap_east] run place template minecraft:zombies/de_pack_a_punch ~-1 ~ ~3 counterclockwise_90

kill @e[type=interaction,distance=..8,tag=pack_a_punch_interaction]

execute unless entity @e[type=marker,distance=..8,tag=de_pack_spawn,limit=1,sort=nearest] as @e[type=marker,distance=..8,tag=!map_pack_a_punch_location,tag=!de_pack_a_punch_location,limit=1,sort=nearest] run tag @s add de_pack_spawn
execute as @e[type=item_display,distance=..3,tag=de_pack_debris] run tag @s add map_pack_a_punch_structure_entity
execute as @e[type=marker,distance=..8,tag=de_pack_spawn,limit=1,sort=nearest] run tag @s add map_pack_a_punch_structure_entity

execute as @e[type=item_display,tag=map_pack_a_punch_structure_entity,distance=..8] run function zbk_der_eisendrache:map_pack_a_punch/display/configure_structure
