# Drop one guaranteed random powerup from a dying Panzer.
# Runs as: Panzer golem or Animated Java root with panzer_id
# Runs at: the Panzer death location

execute store result score #panzer_powerup_roll temp run random value 1..7
scoreboard players operation #temp_pid panzer_id = @s panzer_id

# Existing powerup spawn functions kill their caller, so run them as a throwaway marker.
summon marker ~ ~ ~ {Tags:["panzer_powerup_spawner"]}
execute as @e[type=marker,tag=panzer_powerup_spawner,distance=..0.1,sort=nearest,limit=1] run scoreboard players operation @s panzer_id = #temp_pid panzer_id

execute if score #panzer_powerup_roll temp matches 1 as @e[type=marker,tag=panzer_powerup_spawner] if score @s panzer_id = #temp_pid panzer_id at @s run function zbk:combat/powerups/insta_kill/spawn
execute if score #panzer_powerup_roll temp matches 2 as @e[type=marker,tag=panzer_powerup_spawner] if score @s panzer_id = #temp_pid panzer_id at @s run function zbk:combat/powerups/nuke/spawn
execute if score #panzer_powerup_roll temp matches 3 as @e[type=marker,tag=panzer_powerup_spawner] if score @s panzer_id = #temp_pid panzer_id at @s run function zbk:combat/powerups/max_ammo/spawn
execute if score #panzer_powerup_roll temp matches 4 as @e[type=marker,tag=panzer_powerup_spawner] if score @s panzer_id = #temp_pid panzer_id at @s run function zbk:combat/powerups/double_points/spawn
execute if score #panzer_powerup_roll temp matches 5 as @e[type=marker,tag=panzer_powerup_spawner] if score @s panzer_id = #temp_pid panzer_id at @s run function zbk:combat/powerups/fire_sale/spawn
execute if score #panzer_powerup_roll temp matches 6 as @e[type=marker,tag=panzer_powerup_spawner] if score @s panzer_id = #temp_pid panzer_id at @s run function zbk:combat/powerups/carpenter/spawn
execute if score #panzer_powerup_roll temp matches 7 as @e[type=marker,tag=panzer_powerup_spawner] if score @s panzer_id = #temp_pid panzer_id at @s run function zbk:combat/powerups/death_machine/spawn

execute as @e[type=marker,tag=panzer_powerup_spawner] if score @s panzer_id = #temp_pid panzer_id run kill @s
