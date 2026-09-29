# Refresh every candidate zone before choosing destinations for this anchor.
# Destination tags and zone scratch belong to this call; later anchors must rebuild them.

# Refund or relocate stranded enemies around this anchor.
# Runs as and at: enemy_relocation_anchor marker.

execute unless score #global game_active matches 1 run return run kill @s
execute unless entity @a[gamemode=adventure,team=!downed,distance=..96] run return run kill @s
execute if score @s relocation_timer matches ..0 run return run kill @s

scoreboard players remove @s relocation_timer 1
tag @s add relocation_active_anchor
scoreboard players operation #relocation_zone relocation_zone = @s relocation_zone

# Refresh local spawner zone scores for score comparison.
execute as @e[type=marker,tag=zombie_spawner,distance=..64] run function zbk:behavior/relocation/anchors/refresh_zone
execute as @e[type=marker,tag=dog_spawner,distance=..64] run function zbk:behavior/relocation/anchors/refresh_zone
function zbk:behavior/events/extension/relocation/process_anchor/after_spawner_refresh
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

tag @e[type=marker,tag=relocation_zombie_dest] remove relocation_zombie_dest
tag @e[type=marker,tag=relocation_dog_dest] remove relocation_dog_dest

execute as @e[type=marker,tag=zombie_spawner,scores={spawner_unlocked=1},distance=..64] if score @s relocation_zone = #relocation_zone relocation_zone run tag @s add relocation_zombie_dest
execute as @e[type=marker,tag=dog_spawner,scores={spawner_unlocked=1},distance=..64] if score @s relocation_zone = #relocation_zone relocation_zone run tag @s add relocation_dog_dest
function zbk:behavior/events/extension/relocation/process_anchor/after_candidate_selection
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

tag @e[tag=relocation_candidate] remove relocation_candidate
execute as @e[type=mannequin,tag=hole_zombie,tag=wave_enemy] at @s unless entity @a[gamemode=adventure,team=!downed,distance=..48] run tag @s add relocation_candidate
execute if entity @e[type=marker,tag=relocation_zombie_dest,limit=1] as @e[type=mannequin,tag=hole_zombie,tag=relocation_candidate,limit=16,sort=nearest] at @s run function zbk:behavior/relocation/refunds/refund_mannequin

tag @e[tag=relocation_candidate] remove relocation_candidate
execute as @e[type=mannequin,tag=wall_zombie,tag=wave_enemy] at @s unless entity @a[gamemode=adventure,team=!downed,distance=..48] run tag @s add relocation_candidate
execute if entity @e[type=marker,tag=relocation_zombie_dest,limit=1] as @e[type=mannequin,tag=wall_zombie,tag=relocation_candidate,limit=16,sort=nearest] at @s run function zbk:behavior/relocation/refunds/refund_mannequin

tag @e[tag=relocation_candidate] remove relocation_candidate
execute as @e[type=zombified_piglin,tag=wave_enemy] at @s unless entity @a[gamemode=adventure,team=!downed,distance=..48] run tag @s add relocation_candidate
execute if entity @e[type=marker,tag=relocation_zombie_dest,limit=1] as @e[type=zombified_piglin,tag=relocation_candidate,limit=32,sort=nearest] at @s run function zbk:behavior/relocation/refunds/refund_zombie

tag @e[tag=relocation_candidate] remove relocation_candidate
execute as @e[type=wolf,tag=wave_enemy] at @s unless entity @a[gamemode=adventure,team=!downed,distance=..48] run tag @s add relocation_candidate
execute if entity @e[type=marker,tag=relocation_dog_dest,limit=1] as @e[type=wolf,tag=relocation_candidate,limit=16,sort=nearest] at @s run function zbk:behavior/relocation/refunds/refund_dog
execute unless entity @e[type=marker,tag=relocation_dog_dest,limit=1] if entity @e[type=marker,tag=relocation_zombie_dest,limit=1] as @e[type=wolf,tag=relocation_candidate,limit=16,sort=nearest] at @s run function zbk:behavior/relocation/refunds/refund_dog

tag @e[tag=relocation_candidate] remove relocation_candidate
function zbk:behavior/events/extension/relocation/process_anchor/before_destination_cleanup
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
tag @e[type=marker,tag=relocation_zombie_dest] remove relocation_zombie_dest
tag @e[type=marker,tag=relocation_dog_dest] remove relocation_dog_dest
tag @s remove relocation_active_anchor
