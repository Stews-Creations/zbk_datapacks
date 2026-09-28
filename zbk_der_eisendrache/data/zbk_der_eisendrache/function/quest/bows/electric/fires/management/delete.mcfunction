execute unless score #active zbk.de matches 1 run return 0
execute unless dimension minecraft:overworld run return 0
$scoreboard players set #de_el_place temp $(id)
execute unless score #de_el_place temp matches 1..3 run return run tellraw @s {"text":"Use fire id 1, 2 or 3.","color":"yellow"}
$execute unless score #$(id) de_el_fire_set matches 1 unless entity @e[type=marker,tag=de_el_fire_marker,nbt={data:{id:$(id)}}] run return run tellraw @s {"text":"No fire target with ID $(id) is registered. Stand near the unwanted fire and use fires/management/delete_nearest.","color":"yellow"}
$execute if score #$(id) de_el_fire_lit matches 1 run return run tellraw @s {"text":"Reset the electric fires before deleting a lit target.","color":"yellow"}
$execute unless entity @e[type=marker,tag=de_el_fire_marker,nbt={data:{id:$(id)}}] run return run tellraw @s {"text":"Fire target $(id) is registered but its marker is not loaded. Go to that fire, or use delete_nearest while standing beside the unwanted target.","color":"yellow"}
$kill @e[type=marker,tag=de_el_fire_marker,nbt={data:{id:$(id)}}]
$kill @e[tag=de_el_fire_$(id)_runtime]
$scoreboard players reset #$(id) de_el_fire_set
$scoreboard players reset #$(id) de_el_fire_lit
$tellraw @s {"text":"Electric fire target $(id) removed.","color":"green"}
