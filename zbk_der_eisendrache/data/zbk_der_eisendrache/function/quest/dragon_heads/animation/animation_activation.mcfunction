# Initial activation animation - dramatic head shaking with directional particles

# Get current animation timer value
scoreboard players add @s dragon_head_anim 1

# ===== HEAD 1 (faces SOUTH, base rotation [0,0,0,1]) =====
# Dramatic shaking animation
execute if entity @s[tag=quest_dragon_head_1] if score @s dragon_head_anim matches 0..4 run data merge entity @s {transformation:{left_rotation:[0.3827f,0.0f,0.0f,0.9239f]}}
execute if entity @s[tag=quest_dragon_head_1] if score @s dragon_head_anim matches 5..9 run data merge entity @s {transformation:{left_rotation:[-0.2588f,0.1305f,0.0f,0.9563f]}}
execute if entity @s[tag=quest_dragon_head_1] if score @s dragon_head_anim matches 10..14 run data merge entity @s {transformation:{left_rotation:[0.1305f,-0.1305f,0.0f,0.9828f]}}
execute if entity @s[tag=quest_dragon_head_1] if score @s dragon_head_anim matches 15..19 run data merge entity @s {transformation:{left_rotation:[-0.3827f,0.0924f,0.0f,0.9182f]}}
execute if entity @s[tag=quest_dragon_head_1] if score @s dragon_head_anim matches 20..24 run data merge entity @s {transformation:{left_rotation:[0.2588f,-0.0924f,0.0f,0.9613f]}}
execute if entity @s[tag=quest_dragon_head_1] if score @s dragon_head_anim matches 25..29 run data merge entity @s {transformation:{left_rotation:[-0.1305f,0.0f,0.0f,0.9914f]}}
execute if entity @s[tag=quest_dragon_head_1] if score @s dragon_head_anim matches 30..34 run data merge entity @s {transformation:{left_rotation:[0.0f,0.1305f,0.0f,0.9914f]}}
execute if entity @s[tag=quest_dragon_head_1] if score @s dragon_head_anim matches 35..39 run data merge entity @s {transformation:{left_rotation:[0.0f,0.0f,0.0f,1.0f]}}
# Particles
execute if entity @s[tag=quest_dragon_head_1] at @s run particle dust{color:[1.0,0.5,0.0],scale:1.5} ~ ~ ~1.5 0.3 0.3 0.3 0.8 25 normal
execute if entity @s[tag=quest_dragon_head_1] at @s run particle dust{color:[1.0,0.5,0.0],scale:1.5} ~ ~ ~2.5 0.4 0.4 0.4 0.5 20 normal
execute if entity @s[tag=quest_dragon_head_1] at @s run particle dust{color:[1.0,0.5,0.0],scale:1.5} ~ ~ ~3.5 0.5 0.5 0.5 0.3 15 normal
execute if entity @s[tag=quest_dragon_head_1] at @s run particle minecraft:flame ~ ~ ~1.0 0.2 0.2 0.2 0.05 10 normal
execute if entity @s[tag=quest_dragon_head_1] at @s run particle minecraft:smoke ~ ~ ~2.0 0.3 0.3 0.3 0.02 5 normal

# ===== HEAD 2 (faces WEST, base rotation [0,-0.7071068,0,0.7071068]) =====
# Combined Y-90 + dramatic shaking
execute if entity @s[tag=quest_dragon_head_2] if score @s dragon_head_anim matches 0..4 run data merge entity @s {transformation:{left_rotation:[0.2706f,-0.6533f,0.2706f,0.6533f]}}
execute if entity @s[tag=quest_dragon_head_2] if score @s dragon_head_anim matches 5..9 run data merge entity @s {transformation:{left_rotation:[-0.0923f,-0.7010f,-0.2753f,0.6516f]}}
execute if entity @s[tag=quest_dragon_head_2] if score @s dragon_head_anim matches 10..14 run data merge entity @s {transformation:{left_rotation:[0.1840f,-0.6849f,0.0f,0.7049f]}}
execute if entity @s[tag=quest_dragon_head_2] if score @s dragon_head_anim matches 15..19 run data merge entity @s {transformation:{left_rotation:[-0.2706f,-0.6533f,-0.2706f,0.6533f]}}
execute if entity @s[tag=quest_dragon_head_2] if score @s dragon_head_anim matches 20..24 run data merge entity @s {transformation:{left_rotation:[0.1830f,-0.6830f,0.1830f,0.6830f]}}
execute if entity @s[tag=quest_dragon_head_2] if score @s dragon_head_anim matches 25..29 run data merge entity @s {transformation:{left_rotation:[-0.0923f,-0.7010f,-0.0923f,0.7010f]}}
execute if entity @s[tag=quest_dragon_head_2] if score @s dragon_head_anim matches 30..34 run data merge entity @s {transformation:{left_rotation:[0.0f,-0.7010f,0.0923f,0.7010f]}}
execute if entity @s[tag=quest_dragon_head_2] if score @s dragon_head_anim matches 35..39 run data merge entity @s {transformation:{left_rotation:[0.0f,-0.7071068f,0.0f,0.7071068f]}}
# Particles
execute if entity @s[tag=quest_dragon_head_2] at @s run particle dust{color:[1.0,0.5,0.0],scale:1.5} ~-1.5 ~ ~ 0.3 0.3 0.3 0.8 25 normal
execute if entity @s[tag=quest_dragon_head_2] at @s run particle dust{color:[1.0,0.5,0.0],scale:1.5} ~-2.5 ~ ~ 0.4 0.4 0.4 0.5 20 normal
execute if entity @s[tag=quest_dragon_head_2] at @s run particle dust{color:[1.0,0.5,0.0],scale:1.5} ~-3.5 ~ ~ 0.5 0.5 0.5 0.3 15 normal
execute if entity @s[tag=quest_dragon_head_2] at @s run particle minecraft:flame ~-1.0 ~ ~ 0.2 0.2 0.2 0.05 10 normal
execute if entity @s[tag=quest_dragon_head_2] at @s run particle minecraft:smoke ~-2.0 ~ ~ 0.3 0.3 0.3 0.02 5 normal

# ===== HEAD 3 (faces NORTH, base rotation [0,1,0,0]) =====
# Combined Y-180 + dramatic shaking
execute if entity @s[tag=quest_dragon_head_3] if score @s dragon_head_anim matches 0..4 run data merge entity @s {transformation:{left_rotation:[0.0f,0.9239f,0.3827f,0.0f]}}
execute if entity @s[tag=quest_dragon_head_3] if score @s dragon_head_anim matches 5..9 run data merge entity @s {transformation:{left_rotation:[0.1305f,0.9563f,-0.2588f,0.0f]}}
execute if entity @s[tag=quest_dragon_head_3] if score @s dragon_head_anim matches 10..14 run data merge entity @s {transformation:{left_rotation:[-0.1305f,0.9828f,0.1305f,0.0f]}}
execute if entity @s[tag=quest_dragon_head_3] if score @s dragon_head_anim matches 15..19 run data merge entity @s {transformation:{left_rotation:[0.0924f,0.9182f,-0.3827f,0.0f]}}
execute if entity @s[tag=quest_dragon_head_3] if score @s dragon_head_anim matches 20..24 run data merge entity @s {transformation:{left_rotation:[-0.0924f,0.9613f,0.2588f,0.0f]}}
execute if entity @s[tag=quest_dragon_head_3] if score @s dragon_head_anim matches 25..29 run data merge entity @s {transformation:{left_rotation:[0.0f,0.9914f,-0.1305f,0.0f]}}
execute if entity @s[tag=quest_dragon_head_3] if score @s dragon_head_anim matches 30..34 run data merge entity @s {transformation:{left_rotation:[0.1305f,0.9914f,0.0f,0.0f]}}
execute if entity @s[tag=quest_dragon_head_3] if score @s dragon_head_anim matches 35..39 run data merge entity @s {transformation:{left_rotation:[0.0f,1.0f,0.0f,0.0f]}}
# Particles
execute if entity @s[tag=quest_dragon_head_3] at @s run particle dust{color:[1.0,0.5,0.0],scale:1.5} ~ ~ ~-1.5 0.3 0.3 0.3 0.8 25 normal
execute if entity @s[tag=quest_dragon_head_3] at @s run particle dust{color:[1.0,0.5,0.0],scale:1.5} ~ ~ ~-2.5 0.4 0.4 0.4 0.5 20 normal
execute if entity @s[tag=quest_dragon_head_3] at @s run particle dust{color:[1.0,0.5,0.0],scale:1.5} ~ ~ ~-3.5 0.5 0.5 0.5 0.3 15 normal
execute if entity @s[tag=quest_dragon_head_3] at @s run particle minecraft:flame ~ ~ ~-1.0 0.2 0.2 0.2 0.05 10 normal
execute if entity @s[tag=quest_dragon_head_3] at @s run particle minecraft:smoke ~ ~ ~-2.0 0.3 0.3 0.3 0.02 5 normal

# After 40 ticks, reset timer to start normal waiting animation
execute if score @s dragon_head_anim matches 40.. run scoreboard players set @s dragon_head_anim 0
