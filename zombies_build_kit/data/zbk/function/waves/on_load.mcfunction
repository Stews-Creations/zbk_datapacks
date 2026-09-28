# ===================================
# WAVES MODULE - LOAD
# ===================================
# Purpose: Initialize wave/round management system
#
# Dependencies: global/on_load.mcfunction (temp)
#
# Scoreboards Created:
# - wave.round: Current round number
# - wave.spawn_count: Total enemies to spawn this round
# - wave.spawned: Enemies spawned so far
# - wave.spawn_multiplier: Bonus spawns (increases every 5 rounds)
# - wave.spawn_multiplier_mod: Counter for spawn multiplier (1-5)
# - wave.is_dog_round: 0 for zombies, 1 for dogs
# - wave.next_dog: Next dog round number
# - wave.dog_start_round: Configured first dog round
# - wave.dog_round_interval: Configured rounds between dog rounds
# - wave.show_markers: Toggle for spawn marker particles (0=hidden, 1=visible)
# - wave.health: Enemy health for current round
# - wave.health_base: Base health modifier (constant: 20)
# - wave.is_active: 0=waiting, 1=spawning, 2=round active
# - wave.countdown: Countdown timer before spawn (100 ticks = 5 seconds)
# Speed system
# - wave.spd_walkers: Precise count of walkers left this round
# - wave.spd_normals: Precise count of normal zombies left this round
# - wave.spd_fasts: Precise count of fast zombies left this round
# ===================================

# Core wave tracking
scoreboard objectives add wave.round dummy
scoreboard objectives add wave.spawn_count dummy
scoreboard objectives add wave.spawned dummy
scoreboard objectives add wave.spawn_multiplier dummy
scoreboard objectives add wave.spawn_multiplier_mod dummy

# Special round tracking
scoreboard objectives add wave.is_dog_round dummy
scoreboard objectives add wave.next_dog dummy
scoreboard objectives add wave.dog_interval_add dummy
scoreboard objectives add wave.dog_start_round dummy
scoreboard objectives add wave.dog_round_interval dummy

# Enemy stats
scoreboard objectives add wave.health dummy
scoreboard objectives add wave.health_base dummy
scoreboard objectives add hole_spawn_timer dummy
scoreboard objectives add hole_spawn_health dummy
scoreboard objectives add wall_spawn_timer dummy
scoreboard objectives add wall_spawn_health dummy

# System state
scoreboard objectives add wave.is_active dummy
scoreboard objectives add wave.countdown dummy
scoreboard objectives add wave.show_markers dummy

# Speed pools
scoreboard objectives add wave.spd_walkers dummy
scoreboard objectives add wave.spd_normals dummy
scoreboard objectives add wave.spd_fasts dummy

# Burst spawning system
scoreboard objectives add wave.spawn_delay dummy
scoreboard objectives add wave.spawn_delay_timer dummy
scoreboard objectives add wave.burst_size dummy
scoreboard objectives add wave.burst_spawned dummy
scoreboard objectives add wave.max_alive dummy

# Spawner unlocking
scoreboard objectives add spawner_unlocked dummy

# Special round defaults. Existing positive values are preserved across reloads.
execute unless score #global wave.dog_start_round matches 1.. run scoreboard players set #global wave.dog_start_round 5
execute unless score #global wave.dog_round_interval matches 1.. run scoreboard players set #global wave.dog_round_interval 5

function zbk:waves/management/zombie/load

# Initialize default values
function zbk:waves/initialize

# Set constants (not affected by reset)
scoreboard players set #global wave.health_base 20
scoreboard players set #global wave.show_markers 0

# Book triggers
# (enables are done per-player in waves/initialize)
scoreboard objectives add give_zombie_marker trigger
scoreboard objectives add give_dog_marker trigger
scoreboard objectives add toggle_spawn_markers trigger

scoreboard objectives add wave.panzer_start_round dummy
scoreboard objectives add wave.panzer_round_interval dummy

execute unless score #global wave.panzer_start_round matches 1.. run scoreboard players set #global wave.panzer_start_round 12
execute unless score #global wave.panzer_round_interval matches 1.. run scoreboard players set #global wave.panzer_round_interval 6

scoreboard objectives add give_panzer_marker trigger
