# Executed as and at the saved cabinet marker. Never tag disposable model displays.
execute unless entity @s[type=marker,tag=pm_v2,tag=perk_machine,tag=!wunderfizz] run return 0
execute if score @s pm_bonus_epoch = #current perk_epoch run return 0
execute unless entity @p[predicate=zbk:is_sneaking,gamemode=adventure,team=!downed,distance=..2] run return 0
# Consume before awarding so another player cannot claim the same machine this tick.
tag @s add pm_bonus_claimed
scoreboard players operation @s pm_bonus_epoch = #current perk_epoch
scoreboard players add @p[predicate=zbk:is_sneaking,gamemode=adventure,team=!downed,distance=..2] player_points 100
execute as @p[predicate=zbk:is_sneaking,gamemode=adventure,team=!downed,distance=..2] at @s run function zbk:player/points/audio/cash
