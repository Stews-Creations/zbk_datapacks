# ===================================
# COMBAT POWERUPS SUBMODULE - TICK AS PLAYER
# ===================================
# Purpose: Execute per-player powerup logic (called from execute as @a at @s)
#
# Dependencies: combat/powerups/on_load.mcfunction
# ===================================

function zbk:dispatch/extension/combat/powerups/on_tick_as_player/1
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

# Death Machine: per-player timer countdown, cleanup at expiry.
# Firing is RMB-driven (advancement -> on_use -> fire_tick); see also full_auto_firing.mcfunction for the gap-bridge.
execute if entity @s[tag=death_machine_active] if score @s dm_timer matches 1 run function zbk:combat/powerups/death_machine/cleanup
execute if entity @s[tag=death_machine_active] if score @s dm_timer matches 1.. run scoreboard players remove @s dm_timer 1

# Death Machine sound state machine:
#  - dm_sound_cooldown ticks down so fire_tick re-triggers the clip seamlessly while firing.
#  - dm_firing is refreshed to 4 by fire_tick each time a shot lands; decays when RMB is released.
#    When it hits 1 (about to be 0), force-stop the sound so the long clip doesn't keep playing after release.
execute if entity @s[tag=death_machine_active] if score @s dm_sound_cooldown matches 1.. run scoreboard players remove @s dm_sound_cooldown 1
execute if entity @s[tag=death_machine_active] if score @s dm_firing matches 1 at @s run stopsound @a[distance=..64] player zbk:guns.death_machine_a
execute if entity @s[tag=death_machine_active] if score @s dm_firing matches 1 at @s run stopsound @a[distance=..64] player zbk:guns.death_machine_b
execute if entity @s[tag=death_machine_active] if score @s dm_firing matches 1 run scoreboard players set @s dm_sound_cooldown 0
execute if entity @s[tag=death_machine_active] if score @s dm_firing matches 1.. run scoreboard players remove @s dm_firing 1
