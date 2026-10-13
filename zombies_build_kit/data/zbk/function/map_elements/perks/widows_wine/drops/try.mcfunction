execute unless entity @s[tag=ww_webbed] run return 0
execute unless score @s ww_timer matches 1.. run return 0
# Custom weapons supply kill credit; native melee uses the victim's attacker.
scoreboard players set #ww_owner stats 0
execute if score #map_killer temp matches 1.. run scoreboard players operation #ww_owner stats = #map_killer temp
execute if score #ww_owner stats matches 0 on attacker if entity @s[type=player,scores={id=1..}] run scoreboard players operation #ww_owner stats = @s id
execute unless score #ww_owner stats matches 1.. run return 0
execute store result score #ww_drop stats run random value 1..100
execute if score #ww_drop stats matches ..10 run function zbk:map_elements/perks/widows_wine/drops/spawn
