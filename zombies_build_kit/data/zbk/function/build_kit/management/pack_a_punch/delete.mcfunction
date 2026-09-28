# === DELETE PACK-A-PUNCH ===
function zbk:dispatch/extension/build_kit/management/pack_a_punch/delete/1
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
execute if entity @e[type=marker,tag=pack_a_punch,tag=pap_delete_target,limit=1] as @e[type=marker,tag=pack_a_punch,tag=pap_delete_target,limit=1] at @s run function zbk:build_kit/management/pack_a_punch/delete_entities
execute unless entity @e[type=marker,tag=pack_a_punch,tag=pap_delete_target,limit=1] as @e[type=marker,distance=..5,tag=pack_a_punch,limit=1,sort=nearest] at @s run function zbk:build_kit/management/pack_a_punch/delete_entities

tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Pack-a-Punch deleted.","color":"red"}]
