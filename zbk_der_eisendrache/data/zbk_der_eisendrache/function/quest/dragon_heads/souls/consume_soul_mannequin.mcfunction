# Consume the soul mannequin - dramatic finale when it reaches dragon mouth
# Run at the dragon head position

# Large particle burst at dragon mouth
particle minecraft:soul ~ ~1 ~ 0.5 0.5 0.5 0.3 50 force
particle minecraft:soul_fire_flame ~ ~1 ~ 0.6 0.6 0.6 0.1 30 force
particle minecraft:enchant ~ ~1 ~ 0.5 0.5 0.5 0.5 40 force
particle minecraft:end_rod ~ ~1 ~ 0.4 0.4 0.4 0.2 20 force

# Play dramatic consumption sounds - bite, eat (random variant), swallow, then satisfied growl
playsound zbk_der_eisendrache:dragon.dragonhead_bite master @a ~ ~ ~ 0.25 1
playsound zbk_der_eisendrache:dragon.dragonhead_eat master @a ~ ~ ~ 0.25 1
playsound zbk_der_eisendrache:dragon.dragon_swallow master @a ~ ~ ~ 0.25 1
playsound zbk_der_eisendrache:dragon.dragon_roar_rdy master @a ~ ~ ~ 0.175 0.8

# Visual feedback - make dragon head flash brighter momentarily
execute as @e[tag=dragon_head,scores={dragon_head_mode=1},distance=..2,limit=1,sort=nearest] run data merge entity @s {brightness:{sky:15,block:15}}
