# Dispatch: Player Block
# If a barrier marker is nearby, open barrier dialog instead
# NOTE: Inline cleanup instead of calling cleanup function,
# because cleanup removes open_dialog before we can check barrier proximity
tag @e[tag=build_manager_target,limit=1,sort=nearest] add open_dialog
tag @e[tag=build_manager_target] remove build_manager_target
advancement revoke @s only zbk:build_manager
advancement revoke @s only zbk:build_manager_cooldown
scoreboard players set @s build_manager_trigger_lock 10
scoreboard players set @s build_manager_pending 0

execute at @e[tag=open_dialog,limit=1,sort=nearest] if entity @e[type=marker,tag=barrier,distance=..5] run function zbk:map_elements/barrier/build_kit/dialogs/open_dialog
execute at @e[tag=open_dialog,limit=1,sort=nearest] if entity @e[type=marker,tag=barrier_w3,distance=..5] run function zbk:map_elements/barrier_w3/build_kit/dialogs/open_dialog
execute at @e[tag=open_dialog,limit=1,sort=nearest] unless entity @e[type=marker,tag=barrier,distance=..5] unless entity @e[type=marker,tag=barrier_w3,distance=..5] run function zbk:behavior/areas/player_block/build_kit/dialogs/open_dialog
