$execute unless items entity @s weapon.offhand minecraft:ghast_tear[custom_data~{bo3:true,gun_id:$(id)}] run return 0
# Profile macro. Millisecond carry preserves average fire rate across 50 ms ticks.
$execute if score @s is_reloading_$(slot) matches 1 run return 0
$execute unless score @s ammo_$(slot) matches 1.. run return 0
$execute if score @s bo3_delay_$(slot) matches 1.. run return 0
$scoreboard players set #bo3_mode stats $(mode)
$execute unless score @s bo3_burst_$(slot) matches 1.. if score @s bo3_press matches 1 run scoreboard players set @s bo3_burst_$(slot) $(burst_count)
$execute unless score @s bo3_burst_$(slot) matches 1.. if score #bo3_mode stats matches 0 if score @s bo3_hold matches 1.. run scoreboard players set @s bo3_burst_$(slot) $(burst_count)
$execute unless score @s bo3_burst_$(slot) matches 1.. if score #bo3_mode stats matches 3 if score @s bo3_hold matches 1.. run scoreboard players set @s bo3_burst_$(slot) $(burst_count)
scoreboard players set @s bo3_press 0
$execute unless score @s bo3_burst_$(slot) matches 1.. run return 0
$scoreboard players remove @s ammo_$(slot) 1
$scoreboard players remove @s bo3_burst_$(slot) 1
$scoreboard players set #bo3_interval stats $(interval_ms)
$execute if score @s bo3_burst_$(slot) matches 0 run scoreboard players add #bo3_interval stats $(burst_delay_ms)
# Preserve existing Double Tap timing (twice the fire rate).
execute if score @s perk_doubletap matches 1.. run scoreboard players operation #bo3_interval stats /= #2 stats
$scoreboard players operation @s bo3_delay_$(slot) += #bo3_interval stats
function zombies:combat/weapons/guns/bo3/combat/play_sound with storage zombies:bo3 profile
function zombies:combat/weapons/effects/particles/muzzle_smoke {x:0.25,y:-0.15,z:0.6,mode:"normal"}
function zombies:combat/weapons/mechanics/raycast/start with storage zombies:bo3 profile
$execute if score @s ammo_$(slot) matches ..0 run scoreboard players set @s bo3_burst_$(slot) 0
# At most three shots fit within a tick at the supported rates, even with Double Tap.
scoreboard players add @s bo3_budget 1
execute if score @s bo3_budget matches ..3 run function zombies:combat/weapons/guns/bo3/input/pump with storage zombies:bo3 profile
