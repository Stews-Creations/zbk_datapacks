tag @s add de_el_wall_marker
scoreboard players set @s de_el_broken 0
execute store result entity @s data.sx int 1 run scoreboard players get #de_el_sx temp
execute store result entity @s data.sz int 1 run scoreboard players get #de_el_sz temp
function zbk_der_eisendrache:quest/bows/electric/weather_vane/wall/save with entity @s data
execute if score #de_el_saved temp matches 1 run data modify storage zombies:de_electric_quest wall_position set from entity @s Pos
