# Guard: guns with trail_spacing=0 have no trail
execute if score #trail_spacing stats matches ..0 run return 0

# Copy raycast distance to temp
scoreboard players operation #temp raycast_distance = @s raycast_distance

# Compute modular for trail spacing
scoreboard players operation #temp raycast_distance %= #trail_spacing stats

# Display raygun particles. PaP'd Ray Gun uses the same trail shape in red.
execute if score #gun_id stats matches 7 if score #temp raycast_distance matches 0 if score @s raycast_distance matches 10.. if score #tier stats matches ..0 run function zombies:combat/weapons/effects/particles/raygun_trail
execute if score #gun_id stats matches 7 if score #temp raycast_distance matches 0 if score @s raycast_distance matches 10.. if score #tier stats matches 1.. run function zombies:combat/weapons/effects/particles/raygun_trail_pap

# Display flame_thrower particles
execute if score #gun_id stats matches 2 if score #temp raycast_distance matches 0 if score @s raycast_distance matches 10.. run function zombies:combat/weapons/effects/particles/flame_trail

function zbk:dispatch/extension/combat/weapons/effects/particles/bullet_trail/fallback_0
