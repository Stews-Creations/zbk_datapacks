# Runs as a tram root on arrival, before its route state becomes idle.
execute store result score #active_tram_link global run scoreboard players get @s tram_link_id
execute as @e[type=marker,tag=tram_start,scores={tram_link_id=1..}] if score @s tram_link_id = #active_tram_link global at @s run stopsound @a[distance=..16] master zbk_der_eisendrache:tram.motor_lp
execute as @e[type=marker,tag=tram_stop,scores={tram_link_id=1..}] if score @s tram_link_id = #active_tram_link global at @s run stopsound @a[distance=..16] master zbk_der_eisendrache:tram.motor_lp
execute as @e[type=marker,tag=tram_start,scores={tram_link_id=1..}] if score @s tram_link_id = #active_tram_link global at @s run playsound zbk_der_eisendrache:tram.motor_stop master @a[distance=..16] ~ ~ ~ 1 1
execute as @e[type=marker,tag=tram_stop,scores={tram_link_id=1..}] if score @s tram_link_id = #active_tram_link global at @s run playsound zbk_der_eisendrache:tram.motor_stop master @a[distance=..16] ~ ~ ~ 1 1
scoreboard players set @s tram_motor_timer -1
