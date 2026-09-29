# Accept both new tagged eggs and existing named eggs.
execute as @e[type=bat,name="Mule Kick"] run tag @s add perk_egg_mule_kick
execute as @e[type=bat,tag=perk_egg_mule_kick] at @s align xyz positioned ~0.5 ~ ~0.5 run function zbk:map_elements/perks/machines/placement/mule_kick
