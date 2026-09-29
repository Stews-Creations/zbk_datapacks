# Prefer the exact dialog selection. Existing direct/bonus tools use nearest.
scoreboard players set #deleted pm_v2_id 0
scoreboard players operation #selected pm_v2_id = @s pm_v2_select
execute if score @s pm_v2_select matches 1.. as @e[type=marker,tag=perk_machine,distance=..6] if score @s pm_v2_id = #selected pm_v2_id at @s run function zbk:map_elements/perks/machines/lifecycle/delete_selected
execute unless score @s pm_v2_select matches 1.. as @e[type=marker,tag=perk_machine,distance=..5,sort=nearest,limit=1] at @s run function zbk:map_elements/perks/machines/lifecycle/delete_selected
execute if score #deleted pm_v2_id matches 1 run tellraw @s {text:"[Build Kit] Perk machine deleted.",color:"red"}
execute unless score #deleted pm_v2_id matches 1 run tellraw @s {text:"[Build Kit] Selected machine is gone or out of range. Select it again with the Build Manager.",color:"red"}
scoreboard players reset @s pm_v2_select
