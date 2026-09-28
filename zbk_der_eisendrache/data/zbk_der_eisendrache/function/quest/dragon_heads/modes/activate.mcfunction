# Activate the dragon head - transition from stone to active mode
# Run as the dragon head entity
# First kill just wakes up the head - no soul count, no mannequin

scoreboard players set @s dragon_head_mode 1
scoreboard players set @s dragon_head_anim 0
scoreboard players set @s dragon_head_souls 0

# Set special activation cooldown (40 ticks) for dramatic entrance animation
scoreboard players set @s dragon_head_cooldown 40

# Prime idle sound timer so first idle plays shortly after activation finishes
scoreboard players set @s dragon_idle_sound 170

# Make the dragon head brighter (turn on)
data merge entity @s {brightness:{sky:15,block:15}}

# Play dragon head spawn sound
execute at @s run playsound zbk_der_eisendrache:dragon.dragonhead_spawn master @a ~ ~ ~ 0.25 1

# Debug: Show which head was activated
execute if entity @s[tag=quest_dragon_head_1] run tellraw @a[tag=debug] [{"text":"[Dragon Heads] ","color":"gold"},{"text":"Head 1 has awakened!","color":"light_purple"}]
execute if entity @s[tag=quest_dragon_head_2] run tellraw @a[tag=debug] [{"text":"[Dragon Heads] ","color":"gold"},{"text":"Head 2 has awakened!","color":"light_purple"}]
execute if entity @s[tag=quest_dragon_head_3] run tellraw @a[tag=debug] [{"text":"[Dragon Heads] ","color":"gold"},{"text":"Head 3 has awakened!","color":"light_purple"}]
