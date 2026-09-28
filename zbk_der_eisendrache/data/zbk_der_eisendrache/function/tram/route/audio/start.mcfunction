# Runs as a tram root when its movement delay expires.
execute if score #tram_departing_sound global matches 0 as @a at @s run playsound zbk_der_eisendrache:tram.vox_cast_maxis_gondola_pa_departing master @s ~ ~ ~ 1 1
execute if score #tram_departing_sound global matches 0 run scoreboard players set #tram_departing_sound global 1
execute store result score #active_tram_link global run scoreboard players get @s tram_link_id
execute as @e[type=marker,tag=tram_start,scores={tram_link_id=1..}] if score @s tram_link_id = #active_tram_link global at @s run stopsound @a[distance=..16] master zbk_der_eisendrache:tram.motor_lp
execute as @e[type=marker,tag=tram_stop,scores={tram_link_id=1..}] if score @s tram_link_id = #active_tram_link global at @s run stopsound @a[distance=..16] master zbk_der_eisendrache:tram.motor_lp
execute as @e[type=marker,tag=tram_start,scores={tram_link_id=1..}] if score @s tram_link_id = #active_tram_link global at @s run playsound zbk_der_eisendrache:tram.motor_start master @a[distance=..16] ~ ~ ~ 1 1
execute as @e[type=marker,tag=tram_stop,scores={tram_link_id=1..}] if score @s tram_link_id = #active_tram_link global at @s run playsound zbk_der_eisendrache:tram.motor_start master @a[distance=..16] ~ ~ ~ 1 1
scoreboard players set @s tram_motor_timer 20
