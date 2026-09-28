# Remove nearby Der Eisendrache Pack-a-Punch machine displays and marker.

kill @e[type=block_display,distance=..8,tag=de_pack_a_punch_model]
kill @e[type=item_display,distance=..8,tag=de_pack_a_punch_model]
kill @e[type=text_display,distance=..8,tag=de_pack_a_punch_model]
kill @e[type=interaction,distance=..8,tag=de_pack_a_punch_model]
execute as @e[type=marker,distance=..8,tag=de_pack_a_punch_location,limit=1,sort=nearest] at @s run kill @e[type=item_display,distance=..3,tag=pack_a_punch_gun_display]
kill @e[type=marker,distance=..8,tag=de_pack_a_punch_location]
