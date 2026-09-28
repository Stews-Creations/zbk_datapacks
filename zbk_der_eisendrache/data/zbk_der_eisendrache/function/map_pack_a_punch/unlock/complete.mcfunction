# Called as/at the third linked location marker.

scoreboard players set #map_pap_unlocked map_pap 1

kill @e[type=interaction,tag=map_pack_a_punch_ui]
kill @e[type=item_display,tag=map_pack_a_punch_ui]
kill @e[type=text_display,tag=map_pack_a_punch_ui]

playsound zbk_der_eisendrache:de_pack.spawn master @a ~ ~ ~ 1 1
tellraw @a[tag=debug] [{"text":"[Map Pack-a-Punch] ","color":"light_purple"},{"text":"Pack-a-Punch has materialized.","color":"gold"}]

function zbk_der_eisendrache:map_pack_a_punch/location_manager/activate_here
execute as @e[type=marker,tag=map_pack_a_punch_location,tag=!map_pack_a_punch_active] at @s run function zbk_der_eisendrache:map_pack_a_punch/spawning/spawn_location_ui
