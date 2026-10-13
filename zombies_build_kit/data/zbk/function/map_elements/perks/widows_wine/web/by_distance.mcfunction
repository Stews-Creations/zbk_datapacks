# Keep the wave origin until its strength has been selected.
scoreboard players set #ww_strength stats 40
execute if entity @s[distance=..4] run scoreboard players set #ww_strength stats 75
execute if entity @s[distance=..2] run scoreboard players set #ww_strength stats 100
execute at @s run function zbk:map_elements/perks/widows_wine/web/apply
