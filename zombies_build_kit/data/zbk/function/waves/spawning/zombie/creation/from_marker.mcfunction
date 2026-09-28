# Copy configuration from the explicitly selected source marker.
scoreboard players operation @s wz_source = @e[type=marker,tag=wz_source_marker,limit=1] wz_source
execute if entity @e[type=marker,tag=wz_source_marker,nbt={data:{immune_guns:1b}}] run tag @s add immune_guns
execute if entity @e[type=marker,tag=wz_source_marker,nbt={data:{immune_explosives:1b}}] run tag @s add immune_explosives
execute if entity @e[type=marker,tag=wz_source_marker,nbt={data:{immune_elements:1b}}] run tag @s add immune_elements
execute if entity @e[type=marker,tag=wz_source_marker,nbt={data:{immune_nuke:1b}}] run tag @s add immune_nuke
execute if entity @e[type=marker,tag=wz_source_marker,nbt={data:{immune_melee:1b}}] run tag @s add immune_melee
