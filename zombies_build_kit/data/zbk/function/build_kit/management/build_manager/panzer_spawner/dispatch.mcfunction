# Dispatch: Panzer Spawner
# NOTE: Inline cleanup instead of calling cleanup function,
# because cleanup removes open_dialog before we can read marker data
tag @e[tag=build_manager_target,limit=1,sort=nearest] add open_dialog
tag @e[tag=build_manager_target] remove build_manager_target
advancement revoke @s only zbk:build_manager
advancement revoke @s only zbk:build_manager_cooldown
scoreboard players set @s build_manager_trigger_lock 10
scoreboard players set @s build_manager_pending 0

function zbk:build_kit/management/spawner/dialogs/open_zone_dialog {spawner_type:"Panzer",spawner_tag:"panzer_spawner"}
