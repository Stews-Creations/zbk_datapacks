# Accept both new tagged eggs and existing named eggs.
execute as @e[type=bat,name="Stamina Up"] run tag @s add perk_egg_stamina_up
execute as @e[type=bat,tag=perk_egg_stamina_up] at @s align xyz positioned ~0.5 ~ ~0.5 run function zbk:map_elements/perks/machines/placement/stamina_up
