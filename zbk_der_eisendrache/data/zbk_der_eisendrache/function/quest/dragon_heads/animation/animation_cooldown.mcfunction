# Cooldown animation - directional particles and head movement based on orientation

# Increment animation timer
scoreboard players add @s dragon_head_anim 1

# Reset timer at 60
execute if score @s dragon_head_anim matches 60.. run scoreboard players set @s dragon_head_anim 0

# ===== HEAD 1 (faces SOUTH, base rotation [0,0,0,1]) =====
# Rotation animation (left/right + up/down)
execute if entity @s[tag=quest_dragon_head_1] if score @s dragon_head_anim matches 0..7 run data merge entity @s {transformation:{left_rotation:[0.0f,0.0f,0.0f,1.0f]}}
execute if entity @s[tag=quest_dragon_head_1] if score @s dragon_head_anim matches 8..15 run data merge entity @s {transformation:{left_rotation:[0.1305f,0.0924f,0.0f,0.9877f]}}
execute if entity @s[tag=quest_dragon_head_1] if score @s dragon_head_anim matches 16..22 run data merge entity @s {transformation:{left_rotation:[0.2588f,0.0f,0.0f,0.9659f]}}
execute if entity @s[tag=quest_dragon_head_1] if score @s dragon_head_anim matches 23..30 run data merge entity @s {transformation:{left_rotation:[0.1305f,-0.0924f,0.0f,0.9877f]}}
execute if entity @s[tag=quest_dragon_head_1] if score @s dragon_head_anim matches 31..37 run data merge entity @s {transformation:{left_rotation:[0.0f,0.0f,0.0f,1.0f]}}
execute if entity @s[tag=quest_dragon_head_1] if score @s dragon_head_anim matches 38..45 run data merge entity @s {transformation:{left_rotation:[-0.1305f,-0.0924f,0.0f,0.9877f]}}
execute if entity @s[tag=quest_dragon_head_1] if score @s dragon_head_anim matches 46..52 run data merge entity @s {transformation:{left_rotation:[-0.2588f,0.0f,0.0f,0.9659f]}}
execute if entity @s[tag=quest_dragon_head_1] if score @s dragon_head_anim matches 53..60 run data merge entity @s {transformation:{left_rotation:[-0.1305f,0.0924f,0.0f,0.9877f]}}
# Particles
execute if entity @s[tag=quest_dragon_head_1] at @s run particle dust{color:[1.0,0.5,0.0],scale:1.5} ~ ~ ~1.5 0.3 0.3 0.3 0.8 25 normal
execute if entity @s[tag=quest_dragon_head_1] at @s run particle dust{color:[1.0,0.5,0.0],scale:1.5} ~ ~ ~2.5 0.4 0.4 0.4 0.5 20 normal
execute if entity @s[tag=quest_dragon_head_1] at @s run particle dust{color:[1.0,0.5,0.0],scale:1.5} ~ ~ ~3.5 0.5 0.5 0.5 0.3 15 normal
execute if entity @s[tag=quest_dragon_head_1] if score @s dragon_head_anim matches 0 at @s run particle minecraft:flame ~ ~0.3 ~1.0 0.15 0.15 0.15 0.02 5 normal
execute if entity @s[tag=quest_dragon_head_1] if score @s dragon_head_anim matches 15 at @s run particle minecraft:flame ~ ~0.3 ~1.0 0.15 0.15 0.15 0.02 5 normal
execute if entity @s[tag=quest_dragon_head_1] if score @s dragon_head_anim matches 30 at @s run particle minecraft:flame ~ ~0.3 ~1.0 0.15 0.15 0.15 0.02 5 normal
execute if entity @s[tag=quest_dragon_head_1] if score @s dragon_head_anim matches 45 at @s run particle minecraft:flame ~ ~0.3 ~1.0 0.15 0.15 0.15 0.02 5 normal

# ===== HEAD 2 (faces WEST, base rotation [0,-0.7071068,0,0.7071068]) =====
# Combined Y-90 + movement quaternions
execute if entity @s[tag=quest_dragon_head_2] if score @s dragon_head_anim matches 0..7 run data merge entity @s {transformation:{left_rotation:[0.0f,-0.7071068f,0.0f,0.7071068f]}}
execute if entity @s[tag=quest_dragon_head_2] if score @s dragon_head_anim matches 8..15 run data merge entity @s {transformation:{left_rotation:[0.0923f,-0.6985f,0.0923f,0.6985f]}}
execute if entity @s[tag=quest_dragon_head_2] if score @s dragon_head_anim matches 16..22 run data merge entity @s {transformation:{left_rotation:[0.1830f,-0.6830f,0.1830f,0.6830f]}}
execute if entity @s[tag=quest_dragon_head_2] if score @s dragon_head_anim matches 23..30 run data merge entity @s {transformation:{left_rotation:[0.0923f,-0.6985f,0.0923f,0.6985f]}}
execute if entity @s[tag=quest_dragon_head_2] if score @s dragon_head_anim matches 31..37 run data merge entity @s {transformation:{left_rotation:[0.0f,-0.7071068f,0.0f,0.7071068f]}}
execute if entity @s[tag=quest_dragon_head_2] if score @s dragon_head_anim matches 38..45 run data merge entity @s {transformation:{left_rotation:[-0.0923f,-0.6985f,-0.0923f,0.6985f]}}
execute if entity @s[tag=quest_dragon_head_2] if score @s dragon_head_anim matches 46..52 run data merge entity @s {transformation:{left_rotation:[-0.1830f,-0.6830f,-0.1830f,0.6830f]}}
execute if entity @s[tag=quest_dragon_head_2] if score @s dragon_head_anim matches 53..60 run data merge entity @s {transformation:{left_rotation:[-0.0923f,-0.6985f,-0.0923f,0.6985f]}}
# Particles
execute if entity @s[tag=quest_dragon_head_2] at @s run particle dust{color:[1.0,0.5,0.0],scale:1.5} ~-1.5 ~ ~ 0.3 0.3 0.3 0.8 25 normal
execute if entity @s[tag=quest_dragon_head_2] at @s run particle dust{color:[1.0,0.5,0.0],scale:1.5} ~-2.5 ~ ~ 0.4 0.4 0.4 0.5 20 normal
execute if entity @s[tag=quest_dragon_head_2] at @s run particle dust{color:[1.0,0.5,0.0],scale:1.5} ~-3.5 ~ ~ 0.5 0.5 0.5 0.3 15 normal
execute if entity @s[tag=quest_dragon_head_2] if score @s dragon_head_anim matches 0 at @s run particle minecraft:flame ~-1.0 ~0.3 ~ 0.15 0.15 0.15 0.02 5 normal
execute if entity @s[tag=quest_dragon_head_2] if score @s dragon_head_anim matches 15 at @s run particle minecraft:flame ~-1.0 ~0.3 ~ 0.15 0.15 0.15 0.02 5 normal
execute if entity @s[tag=quest_dragon_head_2] if score @s dragon_head_anim matches 30 at @s run particle minecraft:flame ~-1.0 ~0.3 ~ 0.15 0.15 0.15 0.02 5 normal
execute if entity @s[tag=quest_dragon_head_2] if score @s dragon_head_anim matches 45 at @s run particle minecraft:flame ~-1.0 ~0.3 ~ 0.15 0.15 0.15 0.02 5 normal

# ===== HEAD 3 (faces NORTH, base rotation [0,1,0,0]) =====
# Combined Y-180 + movement quaternions
execute if entity @s[tag=quest_dragon_head_3] if score @s dragon_head_anim matches 0..7 run data merge entity @s {transformation:{left_rotation:[0.0f,1.0f,0.0f,0.0f]}}
execute if entity @s[tag=quest_dragon_head_3] if score @s dragon_head_anim matches 8..15 run data merge entity @s {transformation:{left_rotation:[0.0f,0.9877f,0.1305f,0.0924f]}}
execute if entity @s[tag=quest_dragon_head_3] if score @s dragon_head_anim matches 16..22 run data merge entity @s {transformation:{left_rotation:[0.0f,0.9659f,0.2588f,0.0f]}}
execute if entity @s[tag=quest_dragon_head_3] if score @s dragon_head_anim matches 23..30 run data merge entity @s {transformation:{left_rotation:[0.0f,0.9877f,0.1305f,-0.0924f]}}
execute if entity @s[tag=quest_dragon_head_3] if score @s dragon_head_anim matches 31..37 run data merge entity @s {transformation:{left_rotation:[0.0f,1.0f,0.0f,0.0f]}}
execute if entity @s[tag=quest_dragon_head_3] if score @s dragon_head_anim matches 38..45 run data merge entity @s {transformation:{left_rotation:[0.0f,0.9877f,-0.1305f,-0.0924f]}}
execute if entity @s[tag=quest_dragon_head_3] if score @s dragon_head_anim matches 46..52 run data merge entity @s {transformation:{left_rotation:[0.0f,0.9659f,-0.2588f,0.0f]}}
execute if entity @s[tag=quest_dragon_head_3] if score @s dragon_head_anim matches 53..60 run data merge entity @s {transformation:{left_rotation:[0.0f,0.9877f,-0.1305f,0.0924f]}}
# Particles
execute if entity @s[tag=quest_dragon_head_3] at @s run particle dust{color:[1.0,0.5,0.0],scale:1.5} ~ ~ ~-1.5 0.3 0.3 0.3 0.8 25 normal
execute if entity @s[tag=quest_dragon_head_3] at @s run particle dust{color:[1.0,0.5,0.0],scale:1.5} ~ ~ ~-2.5 0.4 0.4 0.4 0.5 20 normal
execute if entity @s[tag=quest_dragon_head_3] at @s run particle dust{color:[1.0,0.5,0.0],scale:1.5} ~ ~ ~-3.5 0.5 0.5 0.5 0.3 15 normal
execute if entity @s[tag=quest_dragon_head_3] if score @s dragon_head_anim matches 0 at @s run particle minecraft:flame ~ ~0.3 ~-1.0 0.15 0.15 0.15 0.02 5 normal
execute if entity @s[tag=quest_dragon_head_3] if score @s dragon_head_anim matches 15 at @s run particle minecraft:flame ~ ~0.3 ~-1.0 0.15 0.15 0.15 0.02 5 normal
execute if entity @s[tag=quest_dragon_head_3] if score @s dragon_head_anim matches 30 at @s run particle minecraft:flame ~ ~0.3 ~-1.0 0.15 0.15 0.15 0.02 5 normal
execute if entity @s[tag=quest_dragon_head_3] if score @s dragon_head_anim matches 45 at @s run particle minecraft:flame ~ ~0.3 ~-1.0 0.15 0.15 0.15 0.02 5 normal
