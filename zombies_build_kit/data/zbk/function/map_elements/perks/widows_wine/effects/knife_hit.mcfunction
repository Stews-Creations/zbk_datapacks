# Knife enchantment post-attack: victim executor, exact native attacker relation.
execute unless entity @s[type=zombified_piglin,tag=!immune_melee,tag=!combat_ignore,tag=!immune_elements,tag=!turned_zombie] run return 0
scoreboard players set #ww_knife stats 0
execute on attacker if entity @s[type=player,scores={perk_widows=1..}] run scoreboard players set #ww_knife stats 1
execute unless score #ww_knife stats matches 1 run return 0
execute store result score #ww_roll stats run random value 1..100
execute unless score #ww_roll stats matches ..20 run return 0
scoreboard players set #ww_strength stats 100
execute at @s run function zbk:map_elements/perks/widows_wine/web/apply
