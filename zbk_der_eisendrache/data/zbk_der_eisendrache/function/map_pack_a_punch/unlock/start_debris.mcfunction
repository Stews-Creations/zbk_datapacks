# Starts the debris float-away animation for a newly linked location.
# Called as/at the map_pack_a_punch_location marker.

tag @s add map_pap_debris_anim
scoreboard players reset @e[type=item_display,distance=..12,tag=de_pack_debris] map_pap_uses
scoreboard players set @e[type=item_display,distance=..8,tag=de_pack_debris,sort=nearest,limit=7] map_pap_uses 0
execute as @e[type=item_display,distance=..8,tag=de_pack_debris,scores={map_pap_uses=0..},sort=nearest,limit=7] run data merge entity @s {teleport_duration:1}
playsound zbk_der_eisendrache:de_pack.debris player @a[distance=..24] ~ ~ ~ 1 1
