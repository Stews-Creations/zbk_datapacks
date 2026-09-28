execute unless score #active zbk.de matches 1 run return 0
execute unless entity @e[type=marker,tag=de_el_vane_marker,scores={de_el_stage=0}] run return 0
execute unless entity @e[type=marker,tag=de_el_arrow_marker] run return run function zbk_der_eisendrache:quest/bows/electric/weather_vane/interactions/not_ready
scoreboard players set #de_el_count temp 0
execute store result score #de_el_count temp if entity @e[type=marker,tag=de_el_wall_marker]
execute unless score #de_el_count temp matches 1.. run return run function zbk_der_eisendrache:quest/bows/electric/weather_vane/interactions/not_ready
execute unless score #de_el_count temp = @e[type=marker,tag=de_el_vane_marker,limit=1] de_el_walls run return run function zbk_der_eisendrache:quest/bows/electric/weather_vane/interactions/not_ready
execute in zombies:door_storage unless loaded 0 64 -1024 run return run function zbk_der_eisendrache:quest/bows/electric/weather_vane/interactions/not_ready
scoreboard players set @e[type=marker,tag=de_el_vane_marker,limit=1] de_el_stage 1
scoreboard players set @e[type=marker,tag=de_el_vane_marker,limit=1] de_el_timer 41
tag @e[type=item_display,tag=de_el_vane_head] add de_el_vane_spinning
execute at @e[type=item_display,tag=de_el_vane_head,limit=1] run playsound minecraft:item.trident.thunder master @a[distance=..32] ~ ~ ~ 0.6 1.4
execute at @e[type=item_display,tag=de_el_vane_head,limit=1] run playsound zbk_der_eisendrache:der_eisendrache.quest.bows.electric.weathervane_spin master @a[distance=..32] ~ ~ ~ 1 1 0.5
# Consume the shot without a bow explosion behind the model.
scoreboard players set @s raycast_distance 10001
return 1
