# Accept both new tagged eggs and existing named eggs.
execute as @e[type=bat,name="Quick Revive"] run tag @s add perk_egg_quick_revive
execute as @e[type=bat,tag=perk_egg_quick_revive] at @s align xyz positioned ~0.5 ~ ~0.5 run function zbk:map_elements/perks/machines/placement/quick_revive
