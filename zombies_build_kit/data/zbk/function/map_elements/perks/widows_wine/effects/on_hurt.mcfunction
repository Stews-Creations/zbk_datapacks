advancement revoke @s only zbk:widows_wine_hurt
execute unless score @s perk_widows matches 1.. run return 0
execute if entity @s[team=downed] run return 0
execute unless score @s grenade_ammo matches 1.. run return 0
scoreboard players remove @s grenade_ammo 1
execute at @s run function zbk:map_elements/perks/widows_wine/web/wave
