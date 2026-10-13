# Standalone legacy bonus marker, executed as and at the marker.
execute unless entity @s[type=marker,tag=perk_bonus] run return 0
execute if score @s pm_bonus_epoch = #current perk_epoch run return 0
execute unless entity @p[predicate=zbk:is_sneaking,gamemode=adventure,team=!downed,distance=..2] run return 0
tag @s remove bonus_available
scoreboard players operation @s pm_bonus_epoch = #current perk_epoch
scoreboard players add @p[predicate=zbk:is_sneaking,gamemode=adventure,team=!downed,distance=..2] player_points 100
execute as @p[predicate=zbk:is_sneaking,gamemode=adventure,team=!downed,distance=..2] at @s run function zbk:player/points/audio/cash
