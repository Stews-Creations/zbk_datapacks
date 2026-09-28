# === CALCULATE SPEED POOLS ===
# Purpose: Pre-calculate the exact counts of walking, normal, and fast zombies for this round

scoreboard players set #global wave.spd_walkers 0
scoreboard players set #global wave.spd_normals 0
scoreboard players set #global wave.spd_fasts 0

# R1-5: 100% Walkers
execute if score #global wave.round matches 1..5 run scoreboard players operation #global wave.spd_walkers = #global wave.spawn_count

# R6-10: 70% Walking, 30% Normal
# Normal = spawn_count * 30 / 100
execute if score #global wave.round matches 6..10 run scoreboard players operation #global wave.spd_normals = #global wave.spawn_count
execute if score #global wave.round matches 6..10 run scoreboard players set #calc temp 30
execute if score #global wave.round matches 6..10 run scoreboard players operation #global wave.spd_normals *= #calc temp
execute if score #global wave.round matches 6..10 run scoreboard players set #calc temp 100
execute if score #global wave.round matches 6..10 run scoreboard players operation #global wave.spd_normals /= #calc temp

execute if score #global wave.round matches 6..10 run scoreboard players operation #global wave.spd_walkers = #global wave.spawn_count
execute if score #global wave.round matches 6..10 run scoreboard players operation #global wave.spd_walkers -= #global wave.spd_normals

# R11-15: 85% Normal, 15% Walking
# Walker = spawn_count * 15 / 100
execute if score #global wave.round matches 11..15 run scoreboard players operation #global wave.spd_walkers = #global wave.spawn_count
execute if score #global wave.round matches 11..15 run scoreboard players set #calc temp 15
execute if score #global wave.round matches 11..15 run scoreboard players operation #global wave.spd_walkers *= #calc temp
execute if score #global wave.round matches 11..15 run scoreboard players set #calc temp 100
execute if score #global wave.round matches 11..15 run scoreboard players operation #global wave.spd_walkers /= #calc temp

execute if score #global wave.round matches 11..15 run scoreboard players operation #global wave.spd_normals = #global wave.spawn_count
execute if score #global wave.round matches 11..15 run scoreboard players operation #global wave.spd_normals -= #global wave.spd_walkers

# R16-20: 60% Normal, 30% Fast, 10% Walking
# Walker = spawn_count * 10 / 100
# Fast = spawn_count * 30 / 100
execute if score #global wave.round matches 16..20 run scoreboard players operation #global wave.spd_walkers = #global wave.spawn_count
execute if score #global wave.round matches 16..20 run scoreboard players set #calc temp 10
execute if score #global wave.round matches 16..20 run scoreboard players operation #global wave.spd_walkers *= #calc temp
execute if score #global wave.round matches 16..20 run scoreboard players set #calc temp 100
execute if score #global wave.round matches 16..20 run scoreboard players operation #global wave.spd_walkers /= #calc temp

execute if score #global wave.round matches 16..20 run scoreboard players operation #global wave.spd_fasts = #global wave.spawn_count
execute if score #global wave.round matches 16..20 run scoreboard players set #calc temp 30
execute if score #global wave.round matches 16..20 run scoreboard players operation #global wave.spd_fasts *= #calc temp
execute if score #global wave.round matches 16..20 run scoreboard players set #calc temp 100
execute if score #global wave.round matches 16..20 run scoreboard players operation #global wave.spd_fasts /= #calc temp

execute if score #global wave.round matches 16..20 run scoreboard players operation #global wave.spd_normals = #global wave.spawn_count
execute if score #global wave.round matches 16..20 run scoreboard players operation #global wave.spd_normals -= #global wave.spd_walkers
execute if score #global wave.round matches 16..20 run scoreboard players operation #global wave.spd_normals -= #global wave.spd_fasts

# R21+: 85% Fast, 10% Normal, 5% Walking
execute if score #global wave.round matches 21.. run scoreboard players operation #global wave.spd_walkers = #global wave.spawn_count
execute if score #global wave.round matches 21.. run scoreboard players set #calc temp 5
execute if score #global wave.round matches 21.. run scoreboard players operation #global wave.spd_walkers *= #calc temp
execute if score #global wave.round matches 21.. run scoreboard players set #calc temp 100
execute if score #global wave.round matches 21.. run scoreboard players operation #global wave.spd_walkers /= #calc temp

execute if score #global wave.round matches 21.. run scoreboard players operation #global wave.spd_normals = #global wave.spawn_count
execute if score #global wave.round matches 21.. run scoreboard players set #calc temp 10
execute if score #global wave.round matches 21.. run scoreboard players operation #global wave.spd_normals *= #calc temp
execute if score #global wave.round matches 21.. run scoreboard players set #calc temp 100
execute if score #global wave.round matches 21.. run scoreboard players operation #global wave.spd_normals /= #calc temp

execute if score #global wave.round matches 21.. run scoreboard players operation #global wave.spd_fasts = #global wave.spawn_count
execute if score #global wave.round matches 21.. run scoreboard players operation #global wave.spd_fasts -= #global wave.spd_walkers
execute if score #global wave.round matches 21.. run scoreboard players operation #global wave.spd_fasts -= #global wave.spd_normals
