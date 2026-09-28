# The destination footprint can touch a thin floor before its center reaches it.
scoreboard players set @s rs_step_moved 0
execute store result score #rs_foot_height temp run data get entity @s Pos[1] 1000
scoreboard players set #rs_block_unit temp 1000
scoreboard players operation #rs_foot_height temp %= #rs_block_unit temp
execute if score #rs_foot_height temp matches ..-1 run scoreboard players add #rs_foot_height temp 1000
execute rotated ~ 0 positioned ^ ^ ^0.3 run function zbk:combat/weapons/special_equipment/rocket_shield/movement/try_move
execute if score @s rs_step_moved matches 1 run return 0
scoreboard players set #rs_thin_floor temp 0
execute rotated ~ 0 positioned ^ ^ ^0.3 positioned ~0 ~ ~0 if block ~ ~ ~ minecraft:snow run scoreboard players set #rs_thin_floor temp 1
execute rotated ~ 0 positioned ^ ^ ^0.3 positioned ~0 ~ ~0 if block ~ ~ ~ #minecraft:trapdoors[open=false,half=bottom] run scoreboard players set #rs_thin_floor temp 1
execute rotated ~ 0 positioned ^ ^ ^0.3 positioned ~-0.3 ~ ~-0.3 if block ~ ~ ~ minecraft:snow run scoreboard players set #rs_thin_floor temp 1
execute rotated ~ 0 positioned ^ ^ ^0.3 positioned ~-0.3 ~ ~-0.3 if block ~ ~ ~ #minecraft:trapdoors[open=false,half=bottom] run scoreboard players set #rs_thin_floor temp 1
execute rotated ~ 0 positioned ^ ^ ^0.3 positioned ~-0.3 ~ ~0.3 if block ~ ~ ~ minecraft:snow run scoreboard players set #rs_thin_floor temp 1
execute rotated ~ 0 positioned ^ ^ ^0.3 positioned ~-0.3 ~ ~0.3 if block ~ ~ ~ #minecraft:trapdoors[open=false,half=bottom] run scoreboard players set #rs_thin_floor temp 1
execute rotated ~ 0 positioned ^ ^ ^0.3 positioned ~0.3 ~ ~-0.3 if block ~ ~ ~ minecraft:snow run scoreboard players set #rs_thin_floor temp 1
execute rotated ~ 0 positioned ^ ^ ^0.3 positioned ~0.3 ~ ~-0.3 if block ~ ~ ~ #minecraft:trapdoors[open=false,half=bottom] run scoreboard players set #rs_thin_floor temp 1
execute rotated ~ 0 positioned ^ ^ ^0.3 positioned ~0.3 ~ ~0.3 if block ~ ~ ~ minecraft:snow run scoreboard players set #rs_thin_floor temp 1
execute rotated ~ 0 positioned ^ ^ ^0.3 positioned ~0.3 ~ ~0.3 if block ~ ~ ~ #minecraft:trapdoors[open=false,half=bottom] run scoreboard players set #rs_thin_floor temp 1
scoreboard players set #rs_foot_height temp 125
execute if score #rs_thin_floor temp matches 1 rotated ~ 0 positioned ^ ^ ^0.3 align y positioned ~ ~0.125 ~ run function zbk:combat/weapons/special_equipment/rocket_shield/movement/try_move
execute if score @s rs_step_moved matches 1 run return 0
scoreboard players set #rs_foot_height temp 188
execute if score #rs_thin_floor temp matches 1 rotated ~ 0 positioned ^ ^ ^0.3 align y positioned ~ ~0.188 ~ run function zbk:combat/weapons/special_equipment/rocket_shield/movement/try_move
execute if score @s rs_step_moved matches 1 run return 0
scoreboard players set #rs_foot_height temp 250
execute if score #rs_thin_floor temp matches 1 rotated ~ 0 positioned ^ ^ ^0.3 align y positioned ~ ~0.25 ~ run function zbk:combat/weapons/special_equipment/rocket_shield/movement/try_move
execute if score @s rs_step_moved matches 1 run return 0
scoreboard players set #rs_foot_height temp 375
execute if score #rs_thin_floor temp matches 1 rotated ~ 0 positioned ^ ^ ^0.3 align y positioned ~ ~0.375 ~ run function zbk:combat/weapons/special_equipment/rocket_shield/movement/try_move
execute if score @s rs_step_moved matches 1 run return 0
scoreboard players set #rs_foot_height temp 500
execute if score #rs_thin_floor temp matches 1 rotated ~ 0 positioned ^ ^ ^0.3 align y positioned ~ ~0.5 ~ run function zbk:combat/weapons/special_equipment/rocket_shield/movement/try_move
execute if score @s rs_step_moved matches 1 run return 0
scoreboard players set #rs_foot_height temp 625
execute if score #rs_thin_floor temp matches 1 rotated ~ 0 positioned ^ ^ ^0.3 align y positioned ~ ~0.625 ~ run function zbk:combat/weapons/special_equipment/rocket_shield/movement/try_move
execute if score @s rs_step_moved matches 1 run return 0
scoreboard players set #rs_foot_height temp 750
execute if score #rs_thin_floor temp matches 1 rotated ~ 0 positioned ^ ^ ^0.3 align y positioned ~ ~0.75 ~ run function zbk:combat/weapons/special_equipment/rocket_shield/movement/try_move
execute if score @s rs_step_moved matches 1 run return 0
scoreboard players set #rs_foot_height temp 875
execute if score #rs_thin_floor temp matches 1 rotated ~ 0 positioned ^ ^ ^0.3 align y positioned ~ ~0.875 ~ run function zbk:combat/weapons/special_equipment/rocket_shield/movement/try_move
execute if score @s rs_step_moved matches 1 run return 0
# Full top surfaces retain the existing one-block step with complete clearance.
scoreboard players set #rs_foot_height temp 0
execute rotated ~ 0 positioned ^ ^ ^0.3 align y if block ~ ~ ~ #minecraft:slabs positioned ~ ~1 ~ run function zbk:combat/weapons/special_equipment/rocket_shield/movement/try_move
execute if score @s rs_step_moved matches 1 run return 0
execute rotated ~ 0 positioned ^ ^ ^0.3 align y if block ~ ~ ~ #minecraft:stairs positioned ~ ~1 ~ run function zbk:combat/weapons/special_equipment/rocket_shield/movement/try_move
execute if score @s rs_step_moved matches 1 run return 0
execute rotated ~ 0 positioned ^ ^ ^0.3 align y if block ~ ~ ~ #minecraft:trapdoors[open=false,half=top] positioned ~ ~1 ~ run function zbk:combat/weapons/special_equipment/rocket_shield/movement/try_move
execute if score @s rs_step_moved matches 1 run return 0
