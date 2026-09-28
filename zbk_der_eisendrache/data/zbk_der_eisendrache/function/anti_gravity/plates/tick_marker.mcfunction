# Require one non-spectating player to remain on the plate for 60 ticks (3 seconds).
execute if entity @a[gamemode=!spectator,distance=..1.25] run scoreboard players add @s de_ag_plate_t 1
execute if entity @a[gamemode=!spectator,distance=..1.25] if score @s de_ag_plate_t matches 1 run function zbk_der_eisendrache:anti_gravity/plates/audio/start
execute unless entity @a[gamemode=!spectator,distance=..1.25] if score @s de_ag_plate_t matches 1.. run function zbk_der_eisendrache:anti_gravity/plates/audio/reset
execute unless entity @a[gamemode=!spectator,distance=..1.25] run scoreboard players set @s de_ag_plate_t 0

execute if score @s de_ag_plate_t matches 20 run function zbk_der_eisendrache:anti_gravity/plates/effects/low_light
execute if score @s de_ag_plate_t matches 40 run function zbk_der_eisendrache:anti_gravity/plates/effects/high_light
execute if score @s de_ag_plate_t matches 40 run function zbk_der_eisendrache:anti_gravity/plates/audio/stage_two
execute if score @s de_ag_plate_t matches 60.. run function zbk_der_eisendrache:anti_gravity/plates/complete
