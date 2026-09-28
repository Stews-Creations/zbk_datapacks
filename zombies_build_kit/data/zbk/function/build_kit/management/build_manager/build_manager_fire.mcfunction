# Build Manager - Semi-auto tool
# Waits for player to release right-click before opening dialog
# IMPORTANT: Run all checks "at @s" because advancement rewards don't position at player

# If already pending (waiting for right-click release), refresh lock and skip
execute if score @s build_manager_pending matches 1 run scoreboard players set @s build_manager_trigger_lock 3
execute if score @s build_manager_pending matches 1 run advancement revoke @s only zbk:build_manager
execute if score @s build_manager_pending matches 1 run advancement revoke @s only zbk:build_manager_cooldown
execute if score @s build_manager_pending matches 1 run return 0

# Skip if trigger lock is active - also revoke advancement to prevent it staying granted
execute if score @s build_manager_trigger_lock matches 1.. run advancement revoke @s only zbk:build_manager
execute if score @s build_manager_trigger_lock matches 1.. run return 0

# Find and tag the SINGLE closest marker of any type within 5 blocks
execute at @s run tag @e[type=marker,tag=!power_runtime_marker,distance=..5,limit=1,sort=nearest] add build_manager_target

# Check if we found a marker - if not, show error and cleanup
execute unless entity @e[tag=build_manager_target] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"No configurable marker found nearby","color":"red"}]
execute unless entity @e[tag=build_manager_target] run function zbk:build_kit/management/build_manager/cleanup
execute unless entity @e[tag=build_manager_target] run return 0

# Set pending state - wait for player to release right-click before dispatching
scoreboard players set @s build_manager_pending 1
scoreboard players set @s build_manager_trigger_lock 3
advancement revoke @s only zbk:build_manager
advancement revoke @s only zbk:build_manager_cooldown
