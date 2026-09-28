# Stand on top of the built logs at the flame base; IDs are exactly 1, 2 and 3.
execute unless score #active zbk.de matches 1 run return 0
execute unless dimension minecraft:overworld run return 0
$scoreboard players set #de_el_place temp $(id)
execute unless score #de_el_place temp matches 1..3 run return run tellraw @s {"text":"Use fire id 1, 2 or 3.","color":"yellow"}
$execute if score #$(id) de_el_fire_lit matches 1 run return run tellraw @s {"text":"Reset the electric fires before moving a lit target.","color":"yellow"}
$execute if score #$(id) de_el_fire_set matches 1 unless entity @e[type=marker,tag=de_el_fire_marker,nbt={data:{id:$(id)}}] run return run tellraw @s {"text":"Load the old fire placement before moving it.","color":"yellow"}
$kill @e[type=marker,tag=de_el_fire_marker,nbt={data:{id:$(id)}}]
$kill @e[tag=de_el_fire_$(id)_runtime]
$summon marker ~ ~ ~ {Tags:["de_el_fire_marker"],data:{id:$(id)}}
$scoreboard players set #$(id) de_el_fire_set 1
$execute as @e[type=marker,tag=de_el_fire_marker,nbt={data:{id:$(id)}},limit=1] at @s run function zbk_der_eisendrache:quest/bows/electric/fires/display/sync with entity @s data
$tellraw @s {"text":"Electric fire marker $(id) placed at your feet. Shoot just above this spot with the original bow while bound to electric.","color":"aqua"}
