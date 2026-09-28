# Called as/at a Der Eisendrache Pack-a-Punch machine marker.
# Marks the owning map location so the normal map-location delete flow can run.

tag @e[type=marker,tag=map_pack_a_punch_location,tag=map_pap_delete_target] remove map_pap_delete_target
tag @e[type=marker,tag=de_pack_delete_orphan] remove de_pack_delete_orphan

execute if entity @e[type=marker,distance=..8,tag=map_pack_a_punch_active,limit=1,sort=nearest] run scoreboard players set #de_pack_delete_redirect stats 1
execute if entity @e[type=marker,distance=..8,tag=map_pack_a_punch_active,limit=1,sort=nearest] as @e[type=marker,distance=..8,tag=map_pack_a_punch_active,limit=1,sort=nearest] run tag @s add map_pap_delete_target

execute unless entity @e[type=marker,distance=..8,tag=map_pack_a_punch_active,limit=1,sort=nearest] run scoreboard players set #de_pack_delete_redirect stats 2
execute unless entity @e[type=marker,distance=..8,tag=map_pack_a_punch_active,limit=1,sort=nearest] run tag @s add de_pack_delete_orphan
