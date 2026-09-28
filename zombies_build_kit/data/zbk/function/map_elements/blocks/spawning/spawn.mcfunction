# Convert the placed frame into a centered marker and place the lamp.
execute align xyz positioned ~0.5 ~0.5 ~0.5 run summon marker ~ ~ ~ {Tags:["block_power_lamp_marker"]}
execute if score #power_required power matches 1 run setblock ~ ~ ~ minecraft:redstone_lamp[lit=false]
execute if score #power_required power matches 0 run setblock ~ ~ ~ minecraft:redstone_lamp[lit=true]
particle minecraft:end_rod ~ ~0.5 ~ 0.1 0.5 0.1 0.01 10 force
execute as @a[distance=..10,tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Blocks] ","color":"gold"},{"text":"Power lamp marker placed.","color":"green"}]
function zbk:build_kit/util/placement/cleanup
