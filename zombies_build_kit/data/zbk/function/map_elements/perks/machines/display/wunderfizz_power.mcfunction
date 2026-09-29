scoreboard players operation #owner pm_v2_id = @s pm_v2_id
execute if score #power power matches 1 if entity @s[tag=wunderfizz_active_location] as @e[type=item_display,tag=pm_v2_model] if score @s pm_v2_id = #owner pm_v2_id run data merge entity @s {brightness:{block:15,sky:15}}
execute unless score #power power matches 1 as @e[type=item_display,tag=pm_v2_model] if score @s pm_v2_id = #owner pm_v2_id run data remove entity @s brightness
execute unless entity @s[tag=wunderfizz_active_location] as @e[type=item_display,tag=pm_v2_model] if score @s pm_v2_id = #owner pm_v2_id run data remove entity @s brightness
