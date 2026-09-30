# === INITIALIZE WAVES ===
# Purpose: Set wave system to default values
# Called from on_load.mcfunction and game reset

# Kill wave enemies (zombified_piglins and dogs, but leave regular zombies for decoration)
kill @e[type=zombified_piglin,tag=wave_enemy]
kill @e[type=wolf,tag=wave_enemy]
execute as @e[type=mannequin,tag=hole_zombie] at @s run function zbk:waves/spawning/zombie/cleanup/discard_mannequin
execute as @e[type=mannequin,tag=hole_cleanup_mannequin] at @s run function zbk:waves/spawning/zombie/cleanup/discard_mannequin
execute as @e[type=mannequin,tag=wall_zombie] at @s run function zbk:waves/spawning/zombie/cleanup/discard_mannequin
execute as @e[type=mannequin,tag=wall_cleanup_mannequin] at @s run function zbk:waves/spawning/zombie/cleanup/discard_mannequin
kill @e[type=pig,tag=hole_debug_pig]

# Remove all crawler displays
function animated_java:block_bench_crawler/remove/all

function zbk:waves/events/extension/initialize/after_enemy_cleanup
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

# Reset round tracking
scoreboard players set #global wave.round 0
scoreboard players set #global wave.spawn_count 0
scoreboard players set #global wave.spawned 0
scoreboard players set #global wave.spawn_multiplier 5
scoreboard players set #global wave.spawn_multiplier_mod 0
scoreboard players set #global wave.health 0

function zbk:waves/management/zombie/reset

# Reset burst spawning system
scoreboard players set #global wave.spawn_delay 0
scoreboard players set #global wave.spawn_delay_timer 0
scoreboard players set #global wave.burst_size 4
scoreboard players set #global wave.burst_spawned 0
scoreboard players set #global wave.max_alive 50

# Reset special rounds
scoreboard players set #global wave.is_dog_round 0
execute unless score #global wave.dog_start_round matches 1.. run scoreboard players set #global wave.dog_start_round 5
execute unless score #global wave.dog_round_interval matches 1.. run scoreboard players set #global wave.dog_round_interval 5
function zbk:waves/events/extension/initialize/before_dog_round_schedule
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
scoreboard players operation #global wave.next_dog = #global wave.dog_start_round
scoreboard players set #global wave.dog_interval_add 0

# Reset state
scoreboard players set #global wave.is_active 0
scoreboard players set #global wave.countdown 0
scoreboard players set #global wave.round_flash 0

# Clear any pending scheduled round starts (prevents phantom rounds after game over)
schedule clear zbk:waves/management/rounds/start_round

# Lock all spawners initially
scoreboard players set @e[type=marker,tag=zombie_spawner] spawner_unlocked 0
scoreboard players set @e[type=marker,tag=dog_spawner] spawner_unlocked 0
function zbk:waves/events/extension/initialize/before_zone_zero_unlock
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

# Unlock zone 0 spawners (always available)
execute as @e[type=marker,tag=zombie_spawner] if data entity @s {data:{zone:0}} run scoreboard players set @s spawner_unlocked 1
execute as @e[type=marker,tag=dog_spawner] if data entity @s {data:{zone:0}} run scoreboard players set @s spawner_unlocked 1
function zbk:waves/events/extension/initialize/after_zone_zero_unlock
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

function zbk:debug/info {f:"WAVE",m:"Wave system initialized"}
