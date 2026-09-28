# Remove all immunity settings from the nearest spawner of this type.

$execute as @p at @s if entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1] run data remove entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1,sort=nearest] data.immune_guns
$execute as @p at @s if entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1] run data remove entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1,sort=nearest] data.immune_explosives
$execute as @p at @s if entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1] run data remove entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1,sort=nearest] data.immune_elements
$execute as @p at @s if entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1] run data remove entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1,sort=nearest] data.immune_nuke
$execute as @p at @s if entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1] run data remove entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1,sort=nearest] data.immune_melee
$tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"$(spawner_type) spawner mobs are damageable by everything again.","color":"green"}]
$function zbk:build_kit/management/spawner/dialogs/open_immunity_dialog {spawner_type:"$(spawner_type)",spawner_tag:"$(spawner_tag)"}
