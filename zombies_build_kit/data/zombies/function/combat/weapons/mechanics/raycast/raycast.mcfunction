# Straight gun raycast: at most 100 blocks, or 10 for shotgun/flamethrower.
# Stop on unloaded terrain or a real wall before sampling targets.
execute unless loaded ~ ~ ~ run return 0
execute unless block ~ ~ ~ #zombies:raycast_pass run return run function zombies:combat/weapons/mechanics/raycast/block_impact

# Avoid running every interaction handler at each empty 0.1-block sample.
scoreboard players set #ray_interaction stats 0
execute positioned ~-5 ~-5 ~-5 if entity @e[type=interaction,dx=10,dy=10,dz=10] positioned ~5 ~5 ~5 store result score #ray_interaction stats run function zombies:combat/weapons/mechanics/raycast/interactions
execute if score #ray_interaction stats matches 1 run return 0

function zombies:combat/weapons/mechanics/raycast/mobs
# A non-piercing hit consumes the shot with the shared 10001 sentinel.
execute if score @s raycast_distance > #ray_limit stats run return 0

# Show wonder_weapon trail
execute as @s if score #gun_id stats matches 2 run function zombies:combat/weapons/effects/particles/bullet_trail
execute as @s if score #gun_id stats matches 7 run function zombies:combat/weapons/effects/particles/bullet_trail

# Show purple trail for PaP'd regular guns (bullet_trail guards against trail_spacing=0)
function zbk:dispatch/extension/combat/weapons/mechanics/raycast/raycast/fallback_0

# Range expiry is silent. Tail-return avoids repeated cleanup on the way back,
# leaving command budget for ammo, cooldowns and the semi-auto trigger lock.
execute if score @s raycast_distance >= #ray_limit stats run return 0
execute if score #gun_id stats matches 20..46 run scoreboard players add @s raycast_distance 2
execute if score #gun_id stats matches 20..46 positioned ^ ^ ^0.2 run return run function zombies:combat/weapons/mechanics/raycast/raycast
scoreboard players add @s raycast_distance 1
execute positioned ^ ^ ^0.1 run return run function zombies:combat/weapons/mechanics/raycast/raycast
