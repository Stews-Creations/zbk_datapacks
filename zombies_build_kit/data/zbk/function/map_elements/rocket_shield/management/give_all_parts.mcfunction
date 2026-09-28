scoreboard players set #plate rs_collected 1
scoreboard players set #mechanism rs_collected 1
scoreboard players set #rocket rs_collected 1
scoreboard players set @a rs_ui_preview 1
execute in minecraft:overworld run kill @e[tag=rs_part_runtime]
execute in minecraft:the_nether run kill @e[tag=rs_part_runtime]
execute in minecraft:the_end run kill @e[tag=rs_part_runtime]
execute as @a at @s run function zbk:player/inventory/rocket_shield/update
tellraw @s {text:"All Rocket Shield parts collected for the team.",color:"green"}

function zbk:map_elements/crafting_bench/management/check_ready
