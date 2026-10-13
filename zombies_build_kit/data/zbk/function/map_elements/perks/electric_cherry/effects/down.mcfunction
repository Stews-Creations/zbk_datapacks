# Called on entering the downed state, while perk ownership is still available.
execute unless score @s perk_cherry matches 1.. run return 0
execute if entity @s[team=downed] run return 0
scoreboard players set #cherry_spent stats 600
execute at @s run function zbk:map_elements/perks/electric_cherry/effects/prepare
