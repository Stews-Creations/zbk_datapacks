# Active Mode - Dragon head is alive and collecting souls
# Run as dragon_head entities in active mode (mode 1)

# Run different animations based on cooldown state
# Initial activation (40 ticks): dramatic entrance animation
execute if score @s dragon_head_cooldown matches 40 run function zbk_der_eisendrache:quest/dragon_heads/animation/animation_activation

# Soul collection cooldown (1-100): full movement (left/right + up/down)
execute if score @s dragon_head_cooldown matches 1..39 run function zbk_der_eisendrache:quest/dragon_heads/animation/animation_cooldown
execute if score @s dragon_head_cooldown matches 41..100 run function zbk_der_eisendrache:quest/dragon_heads/animation/animation_cooldown

# Waiting for kill: only up/down movement
execute if score @s dragon_head_cooldown matches 0 run function zbk_der_eisendrache:quest/dragon_heads/animation/animation_waiting

# Idle sound timer - plays every 200 ticks (~10 seconds) when waiting for kills
execute if score @s dragon_head_cooldown matches 0 run scoreboard players add @s dragon_idle_sound 1
execute if score @s dragon_head_cooldown matches 0 if score @s dragon_idle_sound matches 200.. at @s run playsound zbk_der_eisendrache:dragon.dragonhead_idle master @a ~ ~ ~ 0.25 1
execute if score @s dragon_head_cooldown matches 0 if score @s dragon_idle_sound matches 200.. run scoreboard players set @s dragon_idle_sound 0

# Decrement cooldown timer
execute if score @s dragon_head_cooldown matches 1.. run scoreboard players remove @s dragon_head_cooldown 1

# Animate all soul mannequins targeting this specific head
execute if entity @s[tag=quest_dragon_head_1] as @e[tag=quest_dragon_soul_mannequin,tag=soul_target_1,distance=..30] at @s run function zbk_der_eisendrache:quest/dragon_heads/souls/animate_soul_mannequin
execute if entity @s[tag=quest_dragon_head_2] as @e[tag=quest_dragon_soul_mannequin,tag=soul_target_2,distance=..30] at @s run function zbk_der_eisendrache:quest/dragon_heads/souls/animate_soul_mannequin
execute if entity @s[tag=quest_dragon_head_3] as @e[tag=quest_dragon_soul_mannequin,tag=soul_target_3,distance=..30] at @s run function zbk_der_eisendrache:quest/dragon_heads/souls/animate_soul_mannequin

# Check if we've collected enough souls to complete (only when no mannequins are animating for THIS head)
# Must have at least 1 soul AND meet the required amount to prevent 0-soul completion
execute store result score #temp dragon_heads_config run scoreboard players get #dragon_souls_needed dragon_heads_config

# Head-specific completion check (only check mannequins targeting this specific head)
execute if entity @s[tag=quest_dragon_head_1] if score @s dragon_head_souls matches 1.. if score @s dragon_head_souls >= #temp dragon_heads_config unless entity @e[tag=quest_dragon_soul_mannequin,tag=soul_target_1] run function zbk_der_eisendrache:quest/dragon_heads/modes/complete
execute if entity @s[tag=quest_dragon_head_2] if score @s dragon_head_souls matches 1.. if score @s dragon_head_souls >= #temp dragon_heads_config unless entity @e[tag=quest_dragon_soul_mannequin,tag=soul_target_2] run function zbk_der_eisendrache:quest/dragon_heads/modes/complete
execute if entity @s[tag=quest_dragon_head_3] if score @s dragon_head_souls matches 1.. if score @s dragon_head_souls >= #temp dragon_heads_config unless entity @e[tag=quest_dragon_soul_mannequin,tag=soul_target_3] run function zbk_der_eisendrache:quest/dragon_heads/modes/complete
