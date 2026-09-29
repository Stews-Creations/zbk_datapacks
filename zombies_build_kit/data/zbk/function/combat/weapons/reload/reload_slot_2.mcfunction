execute if score @s gun_2 matches 20..46 run return run function zbk:combat/weapons/guns/bo3/reload/slot_2
# ===================================
# START RELOAD - SLOT 2
# ===================================
# Purpose: Initialize reload for weapon slot 2
#
# Checks Speed Cola perk and applies reload speed modifier
# ===================================

# Failsafe: revoke active gun's fire advancement in case it's stuck
execute if score @s gun_2 matches 7 run advancement revoke @s only zbk:ray_gun
function zbk:combat/weapons/events/extension/management/reload_slot_2
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

# Set reloading flag
scoreboard players set @s is_reloading_2 1

# Get reload speed from weapon stats based on gun_2 ID
execute if score @s gun_2 matches 1 store result score @s reload_timer_2 run data get storage zbk:weapons guns.double_barrel_shotgun.reload_ticks
execute if score @s gun_2 matches 2 store result score @s reload_timer_2 run data get storage zbk:weapons guns.flame_thrower.reload_ticks
execute if score @s gun_2 matches 3 store result score @s reload_timer_2 run data get storage zbk:weapons guns.grenade_launcher.reload_ticks
execute if score @s gun_2 matches 4 store result score @s reload_timer_2 run data get storage zbk:weapons guns.light_machine_gun.reload_ticks
execute if score @s gun_2 matches 5 store result score @s reload_timer_2 run data get storage zbk:weapons guns.pistol.reload_ticks
execute if score @s gun_2 matches 6 store result score @s reload_timer_2 run data get storage zbk:weapons guns.rainbow_rifle.reload_ticks
execute if score @s gun_2 matches 7 store result score @s reload_timer_2 run data get storage zbk:weapons guns.ray_gun.reload_ticks
execute if score @s gun_2 matches 8 store result score @s reload_timer_2 run data get storage zbk:weapons guns.rifle.reload_ticks
execute if score @s gun_2 matches 9 store result score @s reload_timer_2 run data get storage zbk:weapons guns.shotgun.reload_ticks
execute if score @s gun_2 matches 10 store result score @s reload_timer_2 run data get storage zbk:weapons guns.sniper.reload_ticks

# Apply Speed Cola: Halve reload time if player has the perk
execute unless score #2 stats matches 2 run scoreboard players set #2 stats 2
execute if score @s perk_speed matches 1.. run scoreboard players operation @s reload_timer_2 /= #2 stats

# Debug: show reload timer value (to verify Speed Cola is working)
execute as @s[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[RELOAD] ","color":"aqua"},{"text":"timer: "},{"score":{"name":"@s","objective":"reload_timer_2"},"color":"yellow"},{"text":" perk_speed: "},{"score":{"name":"@s","objective":"perk_speed"},"color":"yellow"}]

# Safety check: If reload timer didn't get set (unknown gun or storage issue), clear reload state
execute unless score @s reload_timer_2 matches 1.. run scoreboard players set @s is_reloading_2 0

# Play reload sound
execute if score @s gun_2 matches 7 if score @s is_reloading_2 matches 1 run function zbk:combat/weapons/reload_audio/start {slug:"ray_gun",slot:2}
execute unless score @s gun_2 matches 7 at @s run playsound minecraft:block.iron_door.open player @s ~ ~ ~ 2.0 1.5

execute if score @s is_reloading_2 matches 1 run function zbk:combat/weapons/events/voice_event_reload
