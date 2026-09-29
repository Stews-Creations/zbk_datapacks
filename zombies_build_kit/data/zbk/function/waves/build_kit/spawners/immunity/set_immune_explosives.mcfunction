# Toggle explosive immunity on the nearest spawner of this type.

scoreboard players set #spawner_toggle global 0
$execute as @p at @s if entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1,sort=nearest,nbt={data:{immune_explosives:1b}}] run scoreboard players set #spawner_toggle global 1
$execute as @p at @s if score #spawner_toggle global matches 1 run data remove entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1,sort=nearest] data.immune_explosives
$execute as @p at @s if score #spawner_toggle global matches 0 run data modify entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1,sort=nearest] data.immune_explosives set value 1b
$execute if score #spawner_toggle global matches 1 run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"$(spawner_type) spawner mobs can be hit by explosives.","color":"green"}]
$execute if score #spawner_toggle global matches 0 run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"$(spawner_type) spawner mobs are immune to explosives.","color":"green"}]
$function zbk:waves/build_kit/spawners/dialogs/open_immunity_dialog {spawner_type:"$(spawner_type)",spawner_tag:"$(spawner_tag)"}
