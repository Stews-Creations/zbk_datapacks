# Activate Mini Dragon Head
# Run as mini_dragon_head (1, 2, or 3)

# Mark as active
tag @s add quest_mini_dragon_active

# Make the mini head brighter (turn on glow)
data merge entity @s {brightness:{sky:15,block:15}}

# Play activation sound
execute at @s run playsound zbk_der_eisendrache:dragon.dragon_fire_breathe master @a ~ ~ ~ 0.25 1

# Initial fire burst
execute at @s run particle minecraft:flame ~ ~0.5 ~ 0.3 0.3 0.3 0.1 30 force
execute at @s run particle minecraft:lava ~ ~0.5 ~ 0.2 0.2 0.2 0 5 force

function zbk:api/debug/info {f:"QUEST",m:"Mini Head activated!"}
