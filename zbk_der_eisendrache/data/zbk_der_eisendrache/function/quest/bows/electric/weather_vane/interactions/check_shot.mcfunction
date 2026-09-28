# Profile 11 is shared by other bows; require the actual original bow slot ID too.
execute unless entity @e[type=marker,tag=de_el_vane_marker,scores={de_el_stage=0}] run return 0
scoreboard players set #de_el_active stats -1
execute if score @s active_weapon matches 0 run scoreboard players operation #de_el_active stats = @s gun_1
execute if score @s active_weapon matches 1 run scoreboard players operation #de_el_active stats = @s gun_2
execute if score @s active_weapon matches 2 run scoreboard players operation #de_el_active stats = @s gun_3
execute unless score #de_el_active stats matches 11 run return 0
scoreboard players set #de_el_contact stats 0
execute as @e[type=interaction,tag=de_el_vane_target,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] run scoreboard players set #de_el_contact stats 1
execute unless score #de_el_contact stats matches 1 run return 0
return run function zbk_der_eisendrache:quest/bows/electric/weather_vane/interactions/start
