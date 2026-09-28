# Apply the same 256-block follow range on every real-piglin creation path.
# This attribute is independent of the relocation distance and does not change wave slot accounting.

# Keep explicit adult state; the data merge also clears the summon scratch tag.
data merge entity @s {IsBaby:0b,Tags:["wave_zombie","wave_enemy"],AngerTime:1000,PersistenceRequired:1b,equipment:{mainhand:{id:"minecraft:golden_sword",count:1,components:{"minecraft:attack_range":{max_reach:0.75,mob_factor:1.0},"minecraft:item_model":"zombies:empty"}}},drop_chances:{mainhand:0.0f},attributes:[{id:"minecraft:follow_range",base:256}]}
data modify entity @s Rotation set from entity @e[type=mannequin,tag=wz_converting,limit=1] Rotation
scoreboard players operation @s wz_source = @e[type=mannequin,tag=wz_converting,limit=1] wz_source
execute if entity @e[type=mannequin,tag=wz_converting,tag=wz_slot] run tag @s add wz_slot
attribute @s minecraft:attack_damage base set 6.67
execute store result entity @s attributes[{id:"minecraft:max_health"}].base double 1 run scoreboard players get #max_health wz_state
data modify entity @s Health set from entity @e[type=mannequin,tag=wz_converting,limit=1] Health
function zombies:behavior/ai/apply_speed
execute if entity @e[type=mannequin,tag=wz_converting,tag=immune_guns] run tag @s add immune_guns
execute if entity @e[type=mannequin,tag=wz_converting,tag=immune_explosives] run tag @s add immune_explosives
execute if entity @e[type=mannequin,tag=wz_converting,tag=immune_elements] run tag @s add immune_elements
execute if entity @e[type=mannequin,tag=wz_converting,tag=immune_nuke] run tag @s add immune_nuke
execute if entity @e[type=mannequin,tag=wz_converting,tag=immune_melee] run tag @s add immune_melee
return 1

function zbk:dispatch/enemy_spawned
