execute store result score #electric_draw_valid temp run function zbk_der_eisendrache:combat/weapons/guns/electric_bow/effects/draw_sound_eligible
execute unless score #electric_draw_valid temp matches 1 run return run function zbk_der_eisendrache:combat/weapons/guns/electric_bow/effects/stop_draw_sound
scoreboard players add @s electric_head 0
execute if score @s electric_head matches 1.. run scoreboard players remove @s electric_head 1
execute unless score @s electric_head matches 1.. at @s run playsound zbk_der_eisendrache:electric_bow.draw_arrowhead master @s ~ ~ ~ 1 1
# Arrowhead source lasts 3.456 seconds; repeat independently every 70 ticks (3.5 seconds).
execute unless score @s electric_head matches 1.. run scoreboard players set @s electric_head 70
scoreboard players add @s electric_draw 0
execute if score @s electric_draw matches 1.. run scoreboard players remove @s electric_draw 1
execute if score @s electric_draw matches 1.. run return 0
stopsound @s master zbk_der_eisendrache:base_bow.bowlauncher_loop_stretch
playsound zbk_der_eisendrache:electric_bow.draw_loop master @s ~ ~ ~ 0.5 1
# Source duration: 1.834667 seconds; repeat after 37 ticks (1.85 seconds).
scoreboard players set @s electric_draw 37
