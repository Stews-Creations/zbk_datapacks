# Build Manager - Dispatch based on marker type
# Called by cooldown when player releases right-click after targeting a marker

# Dispatch based on marker type - only ONE will match
execute if entity @e[tag=build_manager_target,tag=zombie_spawner] run function zbk:waves/build_kit/spawners/zombie/dispatch
execute if entity @e[tag=build_manager_target,tag=dog_spawner] run function zbk:waves/build_kit/spawners/dog/dispatch
function zbk:build_kit/tools/build_manager/events/extension/dispatch/after_spawner_tools
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
execute if entity @e[tag=build_manager_target,tag=door] run function zbk:map_elements/door/build_kit/purchasable/dispatch
execute if entity @e[tag=build_manager_target,tag=door_powered] run function zbk:map_elements/door/build_kit/powered/dispatch
execute if entity @e[tag=build_manager_target,tag=jump_pad] run function zbk:map_elements/jump_pad/build_kit/dispatch
execute if entity @e[tag=build_manager_target,tag=teleporter] run function zbk:map_elements/teleporter/build_kit/dispatch
execute if entity @e[tag=build_manager_target,tag=wall_gun] run function zbk:map_elements/wall_gun/build_kit/dispatch
execute if entity @e[tag=build_manager_target,tag=pack_a_punch] run function zbk:map_elements/pack_a_punch/build_kit/dispatch
function zbk:build_kit/tools/build_manager/events/extension/dispatch/after_machine_tools
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
execute if entity @e[tag=build_manager_target,tag=trap_corner] run function zbk:map_elements/traps/electric/build_kit/dispatch
execute if entity @e[tag=build_manager_target,tag=trap_sign] run function zbk:map_elements/traps/electric/build_kit/dispatch
execute if entity @e[tag=build_manager_target,tag=barrier] run function zbk:map_elements/barrier/build_kit/dispatch
execute if entity @e[tag=build_manager_target,tag=barrier_w3] run function zbk:map_elements/barrier_w3/build_kit/dispatch
execute if entity @e[tag=build_manager_target,tag=mystery_box_location] run function zbk:map_elements/mystery_box/build_kit/dispatch
execute if entity @e[tag=build_manager_target,tag=perk_machine] run function zbk:map_elements/perks/build_kit/machines/dispatch
execute if entity @e[tag=build_manager_target,tag=wunderfizz] run function zbk:map_elements/perks/wunderfizz/build_kit/dispatch
execute if entity @e[tag=build_manager_target,tag=power_build_marker] run function zbk:map_elements/power/build_kit/dispatch
execute if entity @e[tag=build_manager_target,tag=fire_floor_marker] run function zbk:map_elements/fire_floor/build_kit/dispatch
execute if entity @e[tag=build_manager_target,tag=worldspawn] run function zbk:game/lobby/build_kit/dispatch
execute if entity @e[tag=build_manager_target,tag=perk_bonus] run function zbk:map_elements/perks/build_kit/bonus/dispatch
execute if entity @e[tag=build_manager_target,tag=spawn_point_marker] run function zbk:game/spawn_points/build_kit/dispatch
execute if entity @e[tag=build_manager_target,tag=player_block] run function zbk:behavior/areas/player_block/build_kit/dispatch
execute if entity @e[tag=build_manager_target,tag=barrier_zombie_block] run function zbk:behavior/areas/zombie_barrier_block/build_kit/dispatch
execute if entity @e[tag=build_manager_target,tag=custom_door] run function zbk:map_elements/custom_door/build_kit/door/dispatch
execute if entity @e[tag=build_manager_target,tag=custom_door_sign] run function zbk:map_elements/custom_door/build_kit/sign/dispatch
execute if entity @e[tag=build_manager_target,tag=spawn_menu_v2_marker] run function zbk:map_elements/spawn_menu_v2/build_kit/dispatch
execute if entity @e[tag=build_manager_target,tag=explosive_barrel] run function zbk:map_elements/explosive_barrel/build_kit/dispatch
execute if entity @e[tag=build_manager_target,tag=block_power_lamp_marker] run function zbk:map_elements/blocks/build_kit/dispatch
execute if entity @e[tag=build_manager_target,tag=game_signal] run function zbk:map_elements/game_signals/build_kit/dispatch
execute if entity @e[tag=build_manager_target,tag=radio_marker] run function zbk:map_elements/radio/build_kit/dispatch
execute if entity @e[tag=build_manager_target,tag=cutscene_end_start] run function zbk:map_elements/cutscenes/build_kit/dispatch
execute if entity @e[tag=build_manager_target,tag=cutscene_end_finish] run function zbk:map_elements/cutscenes/build_kit/dispatch
execute if entity @e[tag=build_manager_target,tag=cutscene_start_start] run function zbk:map_elements/cutscenes/build_kit/dispatch
execute if entity @e[tag=build_manager_target,tag=cutscene_start_finish] run function zbk:map_elements/cutscenes/build_kit/dispatch
execute if entity @e[tag=build_manager_target,tag=cutscene_end_timed] run function zbk:map_elements/cutscenes/build_kit/dispatch_timed
execute if entity @e[tag=build_manager_target,tag=cutscene_start_timed] run function zbk:map_elements/cutscenes/build_kit/dispatch_timed

execute if entity @e[tag=build_manager_target,tag=rs_part_candidate] run function zbk:map_elements/rocket_shield/build_kit/open_part_marker

execute if entity @e[tag=build_manager_target,tag=cb_marker] run function zbk:map_elements/crafting_bench/build_kit/open_bench_marker

# Fallback: if no dispatcher matched (marker deleted or unknown type), clean up state
execute if entity @e[tag=build_manager_target] run tag @e[tag=build_manager_target] remove build_manager_target
scoreboard players set @s build_manager_pending 0
scoreboard players set @s build_manager_trigger_lock 10
