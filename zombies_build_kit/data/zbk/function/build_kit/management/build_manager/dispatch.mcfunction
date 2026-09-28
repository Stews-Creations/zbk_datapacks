# Build Manager - Dispatch based on marker type
# Called by cooldown when player releases right-click after targeting a marker

# Dispatch based on marker type - only ONE will match
execute if entity @e[tag=build_manager_target,tag=zombie_spawner] run function zbk:build_kit/management/build_manager/zombie_spawner/dispatch
execute if entity @e[tag=build_manager_target,tag=dog_spawner] run function zbk:build_kit/management/build_manager/dog_spawner/dispatch
function zbk:dispatch/extension/build_kit/management/build_manager/dispatch/1
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
execute if entity @e[tag=build_manager_target,tag=door] run function zbk:build_kit/management/build_manager/door/dispatch
execute if entity @e[tag=build_manager_target,tag=door_powered] run function zbk:build_kit/management/build_manager/door_powered/dispatch
execute if entity @e[tag=build_manager_target,tag=jump_pad] run function zbk:build_kit/management/build_manager/jump_pad/dispatch
execute if entity @e[tag=build_manager_target,tag=teleporter] run function zbk:build_kit/management/build_manager/teleporter/dispatch
execute if entity @e[tag=build_manager_target,tag=wall_gun] run function zbk:build_kit/management/build_manager/wall_gun/dispatch
execute if entity @e[tag=build_manager_target,tag=pack_a_punch] run function zbk:build_kit/management/build_manager/pack_a_punch/dispatch
function zbk:dispatch/extension/build_kit/management/build_manager/dispatch/2
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
execute if entity @e[tag=build_manager_target,tag=trap_corner] run function zbk:build_kit/management/build_manager/trap/dispatch
execute if entity @e[tag=build_manager_target,tag=trap_sign] run function zbk:build_kit/management/build_manager/trap/dispatch
execute if entity @e[tag=build_manager_target,tag=barrier] run function zbk:build_kit/management/build_manager/barrier/dispatch
execute if entity @e[tag=build_manager_target,tag=barrier_w3] run function zbk:build_kit/management/build_manager/barrier_w3/dispatch
execute if entity @e[tag=build_manager_target,tag=mystery_box_location] run function zbk:build_kit/management/build_manager/mystery_box/dispatch
execute if entity @e[tag=build_manager_target,tag=perk_machine] run function zbk:build_kit/management/build_manager/perk_machine/dispatch
execute if entity @e[tag=build_manager_target,tag=wunderfizz] run function zbk:build_kit/management/build_manager/wunderfizz/dispatch
execute if entity @e[tag=build_manager_target,tag=power_build_marker] run function zbk:build_kit/management/build_manager/power/dispatch
execute if entity @e[tag=build_manager_target,tag=fire_floor_marker] run function zbk:build_kit/management/build_manager/fire_floor/dispatch
execute if entity @e[tag=build_manager_target,tag=worldspawn] run function zbk:build_kit/management/build_manager/worldspawn/dispatch
execute if entity @e[tag=build_manager_target,tag=perk_bonus] run function zbk:build_kit/management/build_manager/perk_bonus/dispatch
execute if entity @e[tag=build_manager_target,tag=spawn_point_marker] run function zbk:build_kit/management/build_manager/spawn_point/dispatch
execute if entity @e[tag=build_manager_target,tag=player_block] run function zbk:build_kit/management/build_manager/player_block/dispatch
execute if entity @e[tag=build_manager_target,tag=barrier_zombie_block] run function zbk:build_kit/management/build_manager/zombie_block/dispatch
execute if entity @e[tag=build_manager_target,tag=custom_door] run function zbk:build_kit/management/build_manager/custom_door/dispatch
execute if entity @e[tag=build_manager_target,tag=custom_door_sign] run function zbk:build_kit/management/build_manager/custom_door_sign/dispatch
execute if entity @e[tag=build_manager_target,tag=spawn_menu_v2_marker] run function zbk:build_kit/management/build_manager/spawn_menu_v2/dispatch
execute if entity @e[tag=build_manager_target,tag=spawn_menu_marker] run function zbk:build_kit/management/build_manager/spawn_menu/dispatch
execute if entity @e[tag=build_manager_target,tag=explosive_barrel] run function zbk:build_kit/management/build_manager/explosive_barrel/dispatch
execute if entity @e[tag=build_manager_target,tag=block_power_lamp_marker] run function zbk:build_kit/management/build_manager/block_power_lamp/dispatch
execute if entity @e[tag=build_manager_target,tag=game_signal] run function zbk:build_kit/management/build_manager/game_signal/dispatch
execute if entity @e[tag=build_manager_target,tag=radio_marker] run function zbk:build_kit/management/build_manager/radio/dispatch
execute if entity @e[tag=build_manager_target,tag=cutscene_end_start] run function zbk:build_kit/management/build_manager/cutscene/dispatch
execute if entity @e[tag=build_manager_target,tag=cutscene_end_finish] run function zbk:build_kit/management/build_manager/cutscene/dispatch
execute if entity @e[tag=build_manager_target,tag=cutscene_start_start] run function zbk:build_kit/management/build_manager/cutscene/dispatch
execute if entity @e[tag=build_manager_target,tag=cutscene_start_finish] run function zbk:build_kit/management/build_manager/cutscene/dispatch
execute if entity @e[tag=build_manager_target,tag=cutscene_end_timed] run function zbk:build_kit/management/build_manager/cutscene/dispatch_timed
execute if entity @e[tag=build_manager_target,tag=cutscene_start_timed] run function zbk:build_kit/management/build_manager/cutscene/dispatch_timed

execute if entity @e[tag=build_manager_target,tag=rs_part_candidate] run function zbk:build_kit/management/buildables/open_part_marker

execute if entity @e[tag=build_manager_target,tag=cb_marker] run function zbk:build_kit/management/buildables/open_bench_marker

# Fallback: if no dispatcher matched (marker deleted or unknown type), clean up state
execute if entity @e[tag=build_manager_target] run tag @e[tag=build_manager_target] remove build_manager_target
scoreboard players set @s build_manager_pending 0
scoreboard players set @s build_manager_trigger_lock 10
