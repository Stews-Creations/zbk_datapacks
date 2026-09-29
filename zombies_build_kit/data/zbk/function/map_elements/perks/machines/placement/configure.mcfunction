# Keep the selected cardinal orientation on the persistent marker.
scoreboard players set @s playerYaw 0
execute store result score @s playerYaw run data get entity @p[distance=..50] Rotation[0]
execute if score @s playerYaw matches -45..45 run data merge entity @s {Rotation:[0f,0f]}
execute if score @s playerYaw matches 46..135 run data merge entity @s {Rotation:[90f,0f]}
execute if score @s playerYaw matches 136..180 run data merge entity @s {Rotation:[180f,0f]}
execute if score @s playerYaw matches -180..-136 run data merge entity @s {Rotation:[180f,0f]}
execute if score @s playerYaw matches -135..-46 run data merge entity @s {Rotation:[-90f,0f]}
function zbk:map_elements/perks/machines/lifecycle/rebuild
execute if entity @s[tag=wunderfizz] run function zbk:map_elements/perks/wunderfizz/location_manager/assign_sequential_id
execute if entity @s[tag=wunderfizz] unless entity @e[type=marker,tag=wunderfizz_active_location] run function zbk:map_elements/perks/wunderfizz/location_manager/init_system
