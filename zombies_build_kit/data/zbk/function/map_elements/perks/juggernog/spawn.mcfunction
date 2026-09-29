# Accept both new tagged eggs and existing named eggs.
execute as @e[type=bat,name="Juggernog"] run tag @s add perk_egg_juggernog
execute as @e[type=bat,tag=perk_egg_juggernog] at @s align xyz positioned ~0.5 ~ ~0.5 run function zbk:map_elements/perks/machines/placement/juggernog
