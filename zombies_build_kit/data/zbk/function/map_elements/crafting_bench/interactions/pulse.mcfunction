# Actual player context; #clicked identifies the bench for this use event.
execute if entity @s[team=downed] run return run function zbk:map_elements/crafting_bench/build/cancel
execute if entity @s[gamemode=spectator] run return run function zbk:map_elements/crafting_bench/build/cancel
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run return run function zbk:map_elements/crafting_bench/build/cancel
# Measure build range from the player's feet to the clicked bench floor marker.
scoreboard players set #in_range cb_target 0
execute at @s as @e[type=marker,tag=cb_marker,distance=..2.5] if score @s cb_id = #clicked cb_target run scoreboard players set #in_range cb_target 1
execute if score #in_range cb_target matches 0 if entity @s[tag=cb_building] run function zbk:map_elements/crafting_bench/build/cancel
execute if score #in_range cb_target matches 0 at @s rotated as @s run return run function zbk:combat/weapons/mechanics/input/interaction_use
execute if score #shield cb_build matches 2 if score #clicked cb_target = #shield_bench cb_id run return run function zbk:map_elements/crafting_bench/interactions/claim_shield
execute store result score #now cb_stamp run time query gametime
# A fresh click after a gap or on another bench must restart, never resume progress.
execute if entity @s[tag=cb_building] run scoreboard players operation #gap cb_stamp = #now cb_stamp
execute if entity @s[tag=cb_building] run scoreboard players operation #gap cb_stamp -= @s cb_last
execute if entity @s[tag=cb_building] if score #gap cb_stamp matches 5.. run function zbk:map_elements/crafting_bench/build/cancel
execute if entity @s[tag=cb_building] unless score @s cb_target = #clicked cb_target run function zbk:map_elements/crafting_bench/build/cancel
execute if entity @s[tag=cb_building] run return run function zbk:map_elements/crafting_bench/build/continue
execute store result score #recipe cb_build run function zbk:map_elements/crafting_bench/management/next_recipe
execute if score #recipe cb_build matches 0 at @s rotated as @s run return run function zbk:combat/weapons/mechanics/input/interaction_use
function zbk:map_elements/crafting_bench/build/start
