# === START ROUND ===
# Purpose: Begin a new round - increment round number, calculate stats, start countdown
# Called manually or automatically after previous round ends

# Increment round number
scoreboard players add #global wave.round 1

# Fire round start signals
function zbk:map_elements/game_signals/runtime/fire_round_start

# Calculate spawn multiplier (increases every 5 rounds)
function zbk:waves/management/calculations/calculate_spawn_multiplier

# Calculate spawn count for this round
function zbk:waves/management/calculations/calculate_spawn_count

# Calculate speed exact pool counts for this round
function zbk:waves/management/calculations/calculate_speed_pools

# Calculate enemy health for this round
function zbk:waves/management/calculations/calculate_health

# Calculate knife damage for this round (based on enemy health)
function zbk:combat/weapons/knife/calculate_damage

# Calculate burst size and delay for zombie rounds
function zbk:waves/management/calculations/calculate_burst_size
function zbk:waves/management/calculations/calculate_spawn_delay

# Reset spawned counter
scoreboard players set #global wave.spawned 0

# Reset powerup round drop count (kill requirement carries over)
scoreboard players set #global drop_round_drops 0

function zbk:waves/management/zombie/reset_burst

# Reset burst spawning state
scoreboard players set #global wave.burst_spawned 0
scoreboard players set #global wave.spawn_delay_timer 0

# Reset barrier repair point limits for new round
function zbk:map_elements/barrier/management/reset_repair_limits

# Round 2: Upgrade grenade capacity to 4 and give 2 grenades
execute if score #global wave.round matches 2 run function zbk:combat/weapons/grenade/inventory/increase_max_grenades

# Check if this is a dog round
function zbk:waves/special_rounds/dog/check_round
function zbk:waves/special_rounds/panzer/check_round


# Start the HUD round counter animation (player/actionbar/prepare/round/round_flash)
scoreboard players set #global wave.round_flash 80
execute if score #global wave.is_dog_round matches 1 as @a at @s run function zbk:waves/special_rounds/dog/audio/dog_start


# Set countdown timer (100 ticks = 5 seconds)
execute if score #global wave.is_dog_round matches 1 as @a at @s run function zbk:waves/special_rounds/dog/events/voice_event_dog
scoreboard players set #global wave.countdown 100

# Set state to countdown
scoreboard players set #global wave.is_active 1

# Debug logging for zombie rounds
execute if score #global wave.is_dog_round matches 0 run tellraw @a[tag=debug] [{"text":"[Debug] ","color":"gray"},{"text":"Total Zombies: ","color":"white"},{"score":{"name":"#global","objective":"wave.spawn_count"},"color":"yellow"},{"text":" | Burst Size: ","color":"white"},{"score":{"name":"#global","objective":"wave.burst_size"},"color":"aqua"},{"text":" | Delay: ","color":"white"},{"score":{"name":"#global","objective":"wave.spawn_delay"},"color":"green"},{"text":" ticks","color":"green"}]

function zbk:waves/events/round_start
