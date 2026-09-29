execute unless score @s pm_v2_id matches 1.. run function zbk:map_elements/perks/machines/lifecycle/allocate
scoreboard players operation #owner pm_v2_id = @s pm_v2_id
execute as @e[tag=pm_v2_runtime] if score @s pm_v2_id = #owner pm_v2_id run kill @s
# Rebuild also clears the prior orientation's owned side cells.
execute if entity @s[tag=wunderfizz] positioned ~ ~-2 ~ run function zbk:map_elements/perks/machines/collision/clear_sides
execute unless entity @s[tag=wunderfizz] run function zbk:map_elements/perks/machines/collision/clear_sides
execute if entity @s[tag=wunderfizz] positioned ~ ~-2 ~ run function zbk:map_elements/perks/machines/collision/place
execute unless entity @s[tag=wunderfizz] run function zbk:map_elements/perks/machines/collision/place
execute if entity @s[tag=perk_juggernog] run function zbk:map_elements/perks/machines/display/juggernog
execute if entity @s[tag=perk_stamina_up] run function zbk:map_elements/perks/machines/display/stamina_up
execute if entity @s[tag=perk_speed_cola] run function zbk:map_elements/perks/machines/display/speed_cola
execute if entity @s[tag=perk_double_tap] run function zbk:map_elements/perks/machines/display/double_tap
execute if entity @s[tag=perk_quick_revive] run function zbk:map_elements/perks/machines/display/quick_revive
execute if entity @s[tag=perk_mule_kick] run function zbk:map_elements/perks/machines/display/mule_kick
execute if entity @s[tag=wunderfizz] run function zbk:map_elements/perks/machines/display/wunderfizz
scoreboard players operation @e[tag=pm_v2_child] pm_v2_id = @s pm_v2_id
tag @e[tag=pm_v2_child] remove pm_v2_child
execute if entity @s[tag=wunderfizz] run function zbk:map_elements/perks/wunderfizz/spawning/spawn_ui
execute if entity @s[tag=perk_quick_revive] run function zbk:map_elements/perks/quick_revive/update_price_display
tag @s add pm_v2_ready
