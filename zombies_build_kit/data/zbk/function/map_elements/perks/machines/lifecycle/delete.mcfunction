scoreboard players operation #owner pm_v2_id = @s pm_v2_id
execute as @e[tag=pm_v2_runtime] if score @s pm_v2_id = #owner pm_v2_id run kill @s
execute if entity @s[tag=wunderfizz] positioned ~ ~-2 ~ run function zbk:map_elements/perks/machines/collision/clear
execute unless entity @s[tag=wunderfizz] run function zbk:map_elements/perks/machines/collision/clear
execute if entity @s[tag=wunderfizz] run return run function zbk:map_elements/perks/machines/lifecycle/delete_wunderfizz
kill @s
execute as @e[type=marker,tag=pm_v2,distance=..4] at @s run function zbk:map_elements/perks/machines/collision/restore
