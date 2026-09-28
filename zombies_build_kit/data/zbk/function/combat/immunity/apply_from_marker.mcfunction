# Copy optional spawner immunity flags from @s marker to the nearest immunity_target entity.
# Runs as the marker, positioned at the marker.

execute if entity @s[nbt={data:{immune_guns:1b}}] run tag @e[tag=immunity_target,distance=..16,limit=1,sort=nearest] add immune_guns
execute if entity @s[nbt={data:{immune_explosives:1b}}] run tag @e[tag=immunity_target,distance=..16,limit=1,sort=nearest] add immune_explosives
execute if entity @s[nbt={data:{immune_elements:1b}}] run tag @e[tag=immunity_target,distance=..16,limit=1,sort=nearest] add immune_elements
execute if entity @s[nbt={data:{immune_nuke:1b}}] run tag @e[tag=immunity_target,distance=..16,limit=1,sort=nearest] add immune_nuke
execute if entity @s[nbt={data:{immune_melee:1b}}] run tag @e[tag=immunity_target,distance=..16,limit=1,sort=nearest] add immune_melee
tag @e[tag=immunity_target,distance=..16,limit=1,sort=nearest] remove immunity_target
