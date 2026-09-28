# Toggle full combat immunity on the nearest spawner of this type.

scoreboard players set #spawner_toggle global 0
$execute as @p at @s if entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1,sort=nearest,nbt={data:{immune_guns:1b,immune_explosives:1b,immune_elements:1b,immune_nuke:1b,immune_melee:1b}}] run scoreboard players set #spawner_toggle global 1
$execute as @p at @s if score #spawner_toggle global matches 1 run data remove entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1,sort=nearest] data.immune_guns
$execute as @p at @s if score #spawner_toggle global matches 1 run data remove entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1,sort=nearest] data.immune_explosives
$execute as @p at @s if score #spawner_toggle global matches 1 run data remove entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1,sort=nearest] data.immune_elements
$execute as @p at @s if score #spawner_toggle global matches 1 run data remove entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1,sort=nearest] data.immune_nuke
$execute as @p at @s if score #spawner_toggle global matches 1 run data remove entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1,sort=nearest] data.immune_melee
$execute as @p at @s if score #spawner_toggle global matches 0 run data modify entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1,sort=nearest] data.immune_guns set value 1b
$execute as @p at @s if score #spawner_toggle global matches 0 run data modify entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1,sort=nearest] data.immune_explosives set value 1b
$execute as @p at @s if score #spawner_toggle global matches 0 run data modify entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1,sort=nearest] data.immune_elements set value 1b
$execute as @p at @s if score #spawner_toggle global matches 0 run data modify entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1,sort=nearest] data.immune_nuke set value 1b
$execute as @p at @s if score #spawner_toggle global matches 0 run data modify entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1,sort=nearest] data.immune_melee set value 1b
$execute if score #spawner_toggle global matches 1 run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"$(spawner_type) spawner mobs can be hit by everything.","color":"green"}]
$execute if score #spawner_toggle global matches 0 run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"$(spawner_type) spawner mobs are immune to all configured damage.","color":"green"}]
$function zbk:build_kit/management/spawner/dialogs/open_immunity_dialog {spawner_type:"$(spawner_type)",spawner_tag:"$(spawner_tag)"}
