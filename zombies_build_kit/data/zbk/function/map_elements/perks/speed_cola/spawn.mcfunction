# Accept both new tagged eggs and existing named eggs.
execute as @e[type=bat,name="Speed Cola"] run tag @s add perk_egg_speed_cola
execute as @e[type=bat,tag=perk_egg_speed_cola] at @s align xyz positioned ~0.5 ~ ~0.5 run function zbk:map_elements/perks/machines/placement/speed_cola
