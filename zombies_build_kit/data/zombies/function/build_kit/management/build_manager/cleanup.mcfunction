# Cleanup build manager state
tag @e[tag=build_manager_target] remove build_manager_target
tag @e[tag=open_dialog] remove open_dialog
advancement revoke @s only zombies:build_manager
advancement revoke @s only zombies:build_manager_cooldown
scoreboard players set @s build_manager_trigger_lock 10
scoreboard players set @s build_manager_pending 0
