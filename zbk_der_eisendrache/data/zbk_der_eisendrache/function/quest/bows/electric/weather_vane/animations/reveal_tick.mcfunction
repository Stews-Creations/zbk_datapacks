# Complete the wall pass before exposing the arrow reward.
# Keep the loaded-arrow requirement so missing runtime cannot prematurely advance the reveal.

# Ten 72-degree steps make exactly two full turns in 0.5 seconds.
# Then coast through three more turns over 30 ticks, slowing to a stop.
# The final tick lets the one-tick display interpolation settle before the wall breaks.
execute if score @s de_el_timer matches 32..41 as @e[type=item_display,tag=de_el_vane_head] at @s run tp @s ~ ~ ~ ~72 0
execute if score @s de_el_timer matches 2..31 run function zbk_der_eisendrache:quest/bows/electric/weather_vane/animations/slowdown
execute if score @s de_el_timer matches 1.. run scoreboard players remove @s de_el_timer 1
execute if score @s de_el_timer matches 1.. run return 0
# Wait without partial destruction if authoring markers temporarily unload.
scoreboard players set #de_el_count temp 0
execute store result score #de_el_count temp if entity @e[type=marker,tag=de_el_wall_marker]
execute unless score #de_el_count temp = @s de_el_walls run return 0
execute unless entity @e[type=marker,tag=de_el_arrow_marker] run return 0
execute as @e[type=marker,tag=de_el_wall_marker] at @s run function zbk_der_eisendrache:quest/bows/electric/weather_vane/wall/break
execute as @e[type=marker,tag=de_el_arrow_marker,limit=1] at @s rotated as @s run function zbk_der_eisendrache:quest/bows/electric/weather_vane/animations/reveal_arrow

scoreboard players set @s de_el_stage 2
tag @e[type=item_display,tag=de_el_vane_head] remove de_el_vane_spinning
