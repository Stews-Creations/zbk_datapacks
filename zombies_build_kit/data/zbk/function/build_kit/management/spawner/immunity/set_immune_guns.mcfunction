# Toggle gun immunity on the nearest spawner of this type.

scoreboard players set #spawner_toggle global 0
$execute as @p at @s if entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1,sort=nearest,nbt={data:{immune_guns:1b}}] run scoreboard players set #spawner_toggle global 1
$execute as @p at @s if score #spawner_toggle global matches 1 run data remove entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1,sort=nearest] data.immune_guns
$execute as @p at @s if score #spawner_toggle global matches 0 run data modify entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1,sort=nearest] data.immune_guns set value 1b
$execute if score #spawner_toggle global matches 1 run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"$(spawner_type) spawner mobs can be hit by guns.","color":"green"}]
$execute if score #spawner_toggle global matches 0 run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"$(spawner_type) spawner mobs are immune to guns.","color":"green"}]
$function zbk:build_kit/management/spawner/dialogs/open_immunity_dialog {spawner_type:"$(spawner_type)",spawner_tag:"$(spawner_tag)"}
