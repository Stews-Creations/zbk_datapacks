advancement revoke @s only zbk:interaction_crafting_bench
execute if entity @s[gamemode=spectator] run return 0
execute if entity @s[team=downed] run function zbk:map_elements/crafting_bench/build/cancel
execute if entity @s[team=downed] at @s rotated as @s run return run function zbk:combat/weapons/mechanics/input/interaction_use
# Interaction NBT identifies the exact clicked bench, even when locations overlap.
data modify storage zbk:crafting_bench click.player set from entity @s UUID
execute store result score #now cb_stamp run time query gametime
scoreboard players set #clicked cb_target 0
function zbk:map_elements/crafting_bench/interactions/find_clicked with storage zbk:crafting_bench click
execute unless score #clicked cb_target matches 1.. run return 0
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run return run function zbk:build_kit/management/buildables/open_clicked_bench
function zbk:map_elements/crafting_bench/interactions/pulse
