# Animate soul mannequin toward its target dragon head mouth
# Run as the soul mannequin entity

# Increment animation timer
scoreboard players add @s soul_anim_timer 1

# Calculate progress (0-60 ticks = 3 seconds)
# Face the appropriate dragon head and move toward it

# Target Head 1
execute if entity @s[tag=soul_target_1] if score @s soul_anim_timer matches 1..60 facing entity @e[type=block_display,tag=quest_dragon_head_1,scores={dragon_head_mode=1},limit=1,sort=nearest] feet run tp @s ^ ^0.02 ^0.1

# Target Head 2
execute if entity @s[tag=soul_target_2] if score @s soul_anim_timer matches 1..60 facing entity @e[type=block_display,tag=quest_dragon_head_2,scores={dragon_head_mode=1},limit=1,sort=nearest] feet run tp @s ^ ^0.02 ^0.1

# Target Head 3
execute if entity @s[tag=soul_target_3] if score @s soul_anim_timer matches 1..60 facing entity @e[type=block_display,tag=quest_dragon_head_3,scores={dragon_head_mode=1},limit=1,sort=nearest] feet run tp @s ^ ^0.02 ^0.1

# Add particle trail effects during movement
execute if score @s soul_anim_timer matches 1..60 run particle minecraft:soul ~ ~0.5 ~ 0.1 0.1 0.1 0.02 2 force
execute if score @s soul_anim_timer matches 1..60 run particle minecraft:soul_fire_flame ~ ~0.5 ~ 0.15 0.15 0.15 0.01 1 force

# Play ambient soul sound every 20 ticks
execute if score @s soul_anim_timer matches 20 run playsound minecraft:particle.soul_escape hostile @a[distance=..15] ~ ~ ~ 0.6 0.9
execute if score @s soul_anim_timer matches 40 run playsound minecraft:particle.soul_escape hostile @a[distance=..15] ~ ~ ~ 0.6 1.0

# When animation completes (60 ticks), trigger consumption at the target head
execute if entity @s[tag=soul_target_1] if score @s soul_anim_timer matches 60.. positioned as @e[type=block_display,tag=quest_dragon_head_1,scores={dragon_head_mode=1},limit=1,sort=nearest] run function zbk_der_eisendrache:quest/dragon_heads/souls/consume_soul_mannequin
execute if entity @s[tag=soul_target_2] if score @s soul_anim_timer matches 60.. positioned as @e[type=block_display,tag=quest_dragon_head_2,scores={dragon_head_mode=1},limit=1,sort=nearest] run function zbk_der_eisendrache:quest/dragon_heads/souls/consume_soul_mannequin
execute if entity @s[tag=soul_target_3] if score @s soul_anim_timer matches 60.. positioned as @e[type=block_display,tag=quest_dragon_head_3,scores={dragon_head_mode=1},limit=1,sort=nearest] run function zbk_der_eisendrache:quest/dragon_heads/souls/consume_soul_mannequin

# Remove mannequin after animation
execute if score @s soul_anim_timer matches 60.. run tp @s ~ ~-1000 ~
execute if score @s soul_anim_timer matches 60.. run kill @s
