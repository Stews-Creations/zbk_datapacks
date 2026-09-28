# Reset this quest step, restore its wall, and rebuild the authored vane.
function zbk_der_eisendrache:quest/bows/electric/weather_vane/management/cleanup
execute unless score #active zbk.de matches 1 run return 0
tag @e[type=marker,tag=de_el_arrow_marker] add de_bow_pickup
data merge entity @e[type=marker,tag=de_el_arrow_marker,limit=1] {data:{quest:1,model:"lightning"}}
execute as @e[type=marker,tag=de_el_vane_marker,limit=1] at @s rotated as @s run function zbk_der_eisendrache:quest/bows/electric/weather_vane/spawning/runtime
