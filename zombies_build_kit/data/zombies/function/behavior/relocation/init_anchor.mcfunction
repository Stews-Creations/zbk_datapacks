# Initialize an enemy relocation anchor.
# The destination zone is inferred from the nearest unlocked spawner around the arrival point.

scoreboard players set @s relocation_timer 120
scoreboard players set @s relocation_zone -1

execute store result score @s relocation_zone run data get entity @e[type=marker,tag=zombie_spawner,scores={spawner_unlocked=1},distance=..64,sort=nearest,limit=1] data.zone
execute if score @s relocation_zone matches ..-1 store result score @s relocation_zone run data get entity @e[type=marker,tag=dog_spawner,scores={spawner_unlocked=1},distance=..64,sort=nearest,limit=1] data.zone
function zbk:dispatch/extension/behavior/relocation/init_anchor/1
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

execute if score @s relocation_zone matches ..-1 run kill @s
