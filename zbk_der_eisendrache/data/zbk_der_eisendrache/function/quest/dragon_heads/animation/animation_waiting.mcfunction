# Waiting animation - directional particles and head bob based on orientation

# Increment animation timer
scoreboard players add @s dragon_head_anim 1

# Reset timer at 40
execute if score @s dragon_head_anim matches 40.. run scoreboard players set @s dragon_head_anim 0

# ===== HEAD 1 (faces SOUTH, base rotation [0,0,0,1]) =====
# Rotation: tilt up/down on X-axis (simple, no Y rotation to combine)
execute if entity @s[tag=quest_dragon_head_1] if score @s dragon_head_anim matches 0..5 run data merge entity @s {transformation:{left_rotation:[0.0f,0.0f,0.0f,1.0f]}}
execute if entity @s[tag=quest_dragon_head_1] if score @s dragon_head_anim matches 6..10 run data merge entity @s {transformation:{left_rotation:[0.0653f,0.0f,0.0f,0.9979f]}}
execute if entity @s[tag=quest_dragon_head_1] if score @s dragon_head_anim matches 11..15 run data merge entity @s {transformation:{left_rotation:[0.1305f,0.0f,0.0f,0.9914f]}}
execute if entity @s[tag=quest_dragon_head_1] if score @s dragon_head_anim matches 16..20 run data merge entity @s {transformation:{left_rotation:[0.1914f,0.0f,0.0f,0.9815f]}}
execute if entity @s[tag=quest_dragon_head_1] if score @s dragon_head_anim matches 21..25 run data merge entity @s {transformation:{left_rotation:[0.1305f,0.0f,0.0f,0.9914f]}}
execute if entity @s[tag=quest_dragon_head_1] if score @s dragon_head_anim matches 26..30 run data merge entity @s {transformation:{left_rotation:[0.0653f,0.0f,0.0f,0.9979f]}}
execute if entity @s[tag=quest_dragon_head_1] if score @s dragon_head_anim matches 31..40 run data merge entity @s {transformation:{left_rotation:[0.0f,0.0f,0.0f,1.0f]}}
# Particles
execute if entity @s[tag=quest_dragon_head_1] if score @s dragon_head_anim matches 0 at @s run particle dust{color:[1.0,0.5,0.0],scale:0.8} ~ ~0.5 ~0.5 0.1 0.1 0.1 0 3 normal
execute if entity @s[tag=quest_dragon_head_1] if score @s dragon_head_anim matches 10 at @s run particle dust{color:[1.0,0.5,0.0],scale:0.8} ~ ~0.5 ~0.5 0.1 0.1 0.1 0 3 normal
execute if entity @s[tag=quest_dragon_head_1] if score @s dragon_head_anim matches 20 at @s run particle dust{color:[1.0,0.5,0.0],scale:0.8} ~ ~0.5 ~0.5 0.1 0.1 0.1 0 3 normal
execute if entity @s[tag=quest_dragon_head_1] if score @s dragon_head_anim matches 30 at @s run particle dust{color:[1.0,0.5,0.0],scale:0.8} ~ ~0.5 ~0.5 0.1 0.1 0.1 0 3 normal

# ===== HEAD 2 (faces WEST, base rotation [0,-0.7071068,0,0.7071068]) =====
# Combined Y-90 + X-tilt quaternions
execute if entity @s[tag=quest_dragon_head_2] if score @s dragon_head_anim matches 0..5 run data merge entity @s {transformation:{left_rotation:[0.0f,-0.7071068f,0.0f,0.7071068f]}}
execute if entity @s[tag=quest_dragon_head_2] if score @s dragon_head_anim matches 6..10 run data merge entity @s {transformation:{left_rotation:[0.0462f,-0.7057f,0.0462f,0.7057f]}}
execute if entity @s[tag=quest_dragon_head_2] if score @s dragon_head_anim matches 11..15 run data merge entity @s {transformation:{left_rotation:[0.0923f,-0.7010f,0.0923f,0.7010f]}}
execute if entity @s[tag=quest_dragon_head_2] if score @s dragon_head_anim matches 16..20 run data merge entity @s {transformation:{left_rotation:[0.1353f,-0.6935f,0.1353f,0.6935f]}}
execute if entity @s[tag=quest_dragon_head_2] if score @s dragon_head_anim matches 21..25 run data merge entity @s {transformation:{left_rotation:[0.0923f,-0.7010f,0.0923f,0.7010f]}}
execute if entity @s[tag=quest_dragon_head_2] if score @s dragon_head_anim matches 26..30 run data merge entity @s {transformation:{left_rotation:[0.0462f,-0.7057f,0.0462f,0.7057f]}}
execute if entity @s[tag=quest_dragon_head_2] if score @s dragon_head_anim matches 31..40 run data merge entity @s {transformation:{left_rotation:[0.0f,-0.7071068f,0.0f,0.7071068f]}}
# Particles
execute if entity @s[tag=quest_dragon_head_2] if score @s dragon_head_anim matches 0 at @s run particle dust{color:[1.0,0.5,0.0],scale:0.8} ~-0.5 ~0.5 ~ 0.1 0.1 0.1 0 3 normal
execute if entity @s[tag=quest_dragon_head_2] if score @s dragon_head_anim matches 10 at @s run particle dust{color:[1.0,0.5,0.0],scale:0.8} ~-0.5 ~0.5 ~ 0.1 0.1 0.1 0 3 normal
execute if entity @s[tag=quest_dragon_head_2] if score @s dragon_head_anim matches 20 at @s run particle dust{color:[1.0,0.5,0.0],scale:0.8} ~-0.5 ~0.5 ~ 0.1 0.1 0.1 0 3 normal
execute if entity @s[tag=quest_dragon_head_2] if score @s dragon_head_anim matches 30 at @s run particle dust{color:[1.0,0.5,0.0],scale:0.8} ~-0.5 ~0.5 ~ 0.1 0.1 0.1 0 3 normal

# ===== HEAD 3 (faces NORTH, base rotation [0,1,0,0]) =====
# Combined Y-180 + X-tilt quaternions
execute if entity @s[tag=quest_dragon_head_3] if score @s dragon_head_anim matches 0..5 run data merge entity @s {transformation:{left_rotation:[0.0f,1.0f,0.0f,0.0f]}}
execute if entity @s[tag=quest_dragon_head_3] if score @s dragon_head_anim matches 6..10 run data merge entity @s {transformation:{left_rotation:[0.0f,0.9979f,0.0653f,0.0f]}}
execute if entity @s[tag=quest_dragon_head_3] if score @s dragon_head_anim matches 11..15 run data merge entity @s {transformation:{left_rotation:[0.0f,0.9914f,0.1305f,0.0f]}}
execute if entity @s[tag=quest_dragon_head_3] if score @s dragon_head_anim matches 16..20 run data merge entity @s {transformation:{left_rotation:[0.0f,0.9815f,0.1914f,0.0f]}}
execute if entity @s[tag=quest_dragon_head_3] if score @s dragon_head_anim matches 21..25 run data merge entity @s {transformation:{left_rotation:[0.0f,0.9914f,0.1305f,0.0f]}}
execute if entity @s[tag=quest_dragon_head_3] if score @s dragon_head_anim matches 26..30 run data merge entity @s {transformation:{left_rotation:[0.0f,0.9979f,0.0653f,0.0f]}}
execute if entity @s[tag=quest_dragon_head_3] if score @s dragon_head_anim matches 31..40 run data merge entity @s {transformation:{left_rotation:[0.0f,1.0f,0.0f,0.0f]}}
# Particles
execute if entity @s[tag=quest_dragon_head_3] if score @s dragon_head_anim matches 0 at @s run particle dust{color:[1.0,0.5,0.0],scale:0.8} ~ ~0.5 ~-0.5 0.1 0.1 0.1 0 3 normal
execute if entity @s[tag=quest_dragon_head_3] if score @s dragon_head_anim matches 10 at @s run particle dust{color:[1.0,0.5,0.0],scale:0.8} ~ ~0.5 ~-0.5 0.1 0.1 0.1 0 3 normal
execute if entity @s[tag=quest_dragon_head_3] if score @s dragon_head_anim matches 20 at @s run particle dust{color:[1.0,0.5,0.0],scale:0.8} ~ ~0.5 ~-0.5 0.1 0.1 0.1 0 3 normal
execute if entity @s[tag=quest_dragon_head_3] if score @s dragon_head_anim matches 30 at @s run particle dust{color:[1.0,0.5,0.0],scale:0.8} ~ ~0.5 ~-0.5 0.1 0.1 0.1 0 3 normal
