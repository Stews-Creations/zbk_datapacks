# Called as/at the map_pack_a_punch_location marker to delete.

execute if entity @s[tag=map_pack_a_punch_active] run function zbk_der_eisendrache:map_pack_a_punch/location_manager/deactivate_here

execute if entity @s[tag=map_pap_south] run place template minecraft:zombies/de_pack_empty ~-3 ~ ~-1 none
execute if entity @s[tag=map_pap_west] run place template minecraft:zombies/de_pack_empty ~1 ~ ~-3 clockwise_90
execute if entity @s[tag=map_pap_north] run place template minecraft:zombies/de_pack_empty ~3 ~ ~1 180
execute if entity @s[tag=map_pap_east] run place template minecraft:zombies/de_pack_empty ~-1 ~ ~3 counterclockwise_90

kill @e[type=interaction,distance=..3,tag=map_pack_a_punch_ui]
kill @e[type=item_display,distance=..3,tag=map_pack_a_punch_ui]
kill @e[type=text_display,distance=..3,tag=map_pack_a_punch_ui]
execute as @e[type=item_display,distance=..8,tag=de_pack_debris] on passengers run kill @s
execute as @e[type=item_display,distance=..8,tag=de_pack_debris_anim] on passengers run kill @s
kill @e[distance=..8,tag=de_pack_debris]
kill @e[distance=..8,tag=de_pack_debris_anim]
kill @e[type=marker,distance=..8,tag=de_pack_spawn,tag=!de_pack_a_punch_location]

kill @s
