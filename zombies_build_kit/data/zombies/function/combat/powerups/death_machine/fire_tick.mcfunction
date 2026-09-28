# Cooldown gate - 2 ticks between shots (10 shots/sec, matches LMG cadence)
execute if score @s dm_fire_cooldown matches 1.. run scoreboard players remove @s dm_fire_cooldown 1
execute if score @s dm_fire_cooldown matches 1.. run return 0
scoreboard players set @s dm_fire_cooldown 2

# Raycast state setup (inline equivalent of weapons/mechanics/raycast/start.mcfunction)
scoreboard players set #gun_id stats 13
scoreboard players operation #damage stats = #global wave.round
scoreboard players add #damage stats 25
scoreboard players set #is_piercing stats 1
scoreboard players set #spread_radius stats 0
scoreboard players set #trail_spacing stats 0
scoreboard players set #is_explosive stats 0
scoreboard players set #explosive_damage stats 0
scoreboard players set #explosive_radius stats 0
scoreboard players set #tier stats 0
scoreboard players set #element stats 0
execute store result score #player stats run scoreboard players get @s id

# Old per-shot LMG sound (custom death_machine loop is parked for now).
playsound zbk:guns.light_machine_gun ambient @a[distance=..16] ~ ~ ~ 2 1.5 1

# Firing-state flag (decays in on_tick_as_player when on_use stops being called -> RMB released)
scoreboard players set @s dm_firing 4

# Muzzle cosmetic
function zombies:combat/weapons/effects/particles/muzzle_smoke {x:0.3,y:-0.1,z:0.5,mode:"force"}

# Tag prevents shooter from being hit by their own raycast
tag @s add raycasting

# Fire
scoreboard players set @s raycast_distance 0
scoreboard players set #ray_limit stats 1000
execute at @s anchored eyes positioned ^ ^ ^ rotated as @s run function zombies:combat/weapons/mechanics/raycast/raycast

# Cleanup
tag @e[tag=raycast_hit] remove raycast_hit
tag @e[type=interaction,tag=menu_raycast_hit] remove menu_raycast_hit
tag @e[type=interaction,tag=menu_v2_raycast_hit] remove menu_v2_raycast_hit
tag @s remove raycasting
scoreboard players reset @s raycast_distance
