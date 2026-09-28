# Play the measured 2.5-second motor loop at this route's Start and End sound zones.
execute store result score #active_tram_link global run scoreboard players get @s tram_link_id
execute as @e[type=marker,tag=tram_start,scores={tram_link_id=1..}] if score @s tram_link_id = #active_tram_link global at @s run playsound zbk_der_eisendrache:tram.motor_lp master @a[distance=..16] ~ ~ ~ 0.5 1
execute as @e[type=marker,tag=tram_stop,scores={tram_link_id=1..}] if score @s tram_link_id = #active_tram_link global at @s run playsound zbk_der_eisendrache:tram.motor_lp master @a[distance=..16] ~ ~ ~ 0.5 1
scoreboard players set @s tram_motor_timer 50
