# Resummon a stranded Panzer near this anchor while preserving current health.
# Runs as and at: panzer_ai iron golem.

execute store result score #relocation_panzer_health relocation_health run data get entity @s Health
execute if score #relocation_panzer_health relocation_health matches ..0 run return 0

tag @s add panzer_relocating
tag @e[tag=relocation_panzer_target] remove relocation_panzer_target
execute at @e[type=marker,tag=enemy_relocation_anchor,tag=relocation_active_anchor,limit=1] run tag @e[type=marker,tag=relocation_panzer_dest,distance=..64,sort=random,limit=1] add relocation_panzer_target
execute unless entity @e[type=marker,tag=relocation_panzer_target,limit=1] run return run tag @s remove panzer_relocating

execute at @e[type=marker,tag=relocation_panzer_target,limit=1] run summon minecraft:marker ~ ~ ~ {Tags:["panzer_spawn_pending","panzer_relocation_pending","panzer_spawn_new","wave_enemy"]}
execute at @e[type=marker,tag=relocation_panzer_target,limit=1] run scoreboard players set @e[type=minecraft:marker,tag=panzer_spawn_new,distance=..0.25,sort=nearest,limit=1] panzer_spawn_timer 20
execute at @e[type=marker,tag=relocation_panzer_target,limit=1] run scoreboard players operation @e[type=minecraft:marker,tag=panzer_spawn_new,distance=..0.25,sort=nearest,limit=1] relocation_health = #relocation_panzer_health relocation_health

execute at @e[type=marker,tag=relocation_panzer_target,limit=1] if entity @s[tag=immune_guns] run data modify entity @e[type=minecraft:marker,tag=panzer_spawn_new,distance=..0.25,sort=nearest,limit=1] data.immune_guns set value 1b
execute at @e[type=marker,tag=relocation_panzer_target,limit=1] if entity @s[tag=immune_explosives] run data modify entity @e[type=minecraft:marker,tag=panzer_spawn_new,distance=..0.25,sort=nearest,limit=1] data.immune_explosives set value 1b
execute at @e[type=marker,tag=relocation_panzer_target,limit=1] if entity @s[tag=immune_elements] run data modify entity @e[type=minecraft:marker,tag=panzer_spawn_new,distance=..0.25,sort=nearest,limit=1] data.immune_elements set value 1b
execute at @e[type=marker,tag=relocation_panzer_target,limit=1] if entity @s[tag=immune_nuke] run data modify entity @e[type=minecraft:marker,tag=panzer_spawn_new,distance=..0.25,sort=nearest,limit=1] data.immune_nuke set value 1b
execute at @e[type=marker,tag=relocation_panzer_target,limit=1] if entity @s[tag=immune_melee] run data modify entity @e[type=minecraft:marker,tag=panzer_spawn_new,distance=..0.25,sort=nearest,limit=1] data.immune_melee set value 1b
execute at @e[type=marker,tag=relocation_panzer_target,limit=1] run tag @e[type=minecraft:marker,tag=panzer_spawn_new,distance=..0.25,sort=nearest,limit=1] remove panzer_spawn_new

execute if score @s panzer_id matches 1.. run scoreboard players operation #relocation_panzer_id panzer_id = @s panzer_id
execute if score @s panzer_id matches 1.. as @e[type=minecraft:item_display,tag=aj.de_panzer.root] if score @s panzer_id = #relocation_panzer_id panzer_id run function animated_java:de_panzer/remove/this/without_on_remove_function

tag @e[tag=relocation_panzer_target] remove relocation_panzer_target
kill @s
