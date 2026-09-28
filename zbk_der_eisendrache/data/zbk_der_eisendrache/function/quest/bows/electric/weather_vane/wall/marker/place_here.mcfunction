# Position is the block's integer corner. Preserve its full state in the existing storage dimension.
execute unless score #active zbk.de matches 1 run return 0
execute unless dimension minecraft:overworld run return 0
execute unless entity @e[type=marker,tag=de_el_vane_marker,distance=..40] run return 0
execute if entity @e[type=marker,tag=de_el_vane_marker,scores={de_el_stage=1..}] run return 0
execute if entity @e[type=marker,tag=de_el_wall_marker,distance=..0.1] run return run tellraw @s {"text":"[Electric Bow] This wall block is already marked.","color":"yellow"}
execute if data block ~ ~ ~ {} run return run tellraw @s {"text":"[Electric Bow] Use ordinary wall blocks; block entities are not supported here.","color":"yellow"}
execute if block ~ ~ ~ minecraft:air run return 0
execute if block ~ ~ ~ minecraft:cave_air run return 0
execute if block ~ ~ ~ minecraft:void_air run return 0
execute in zbk:door_storage unless loaded 0 64 -1024 run return run tellraw @s {"text":"[Electric Bow] Wall storage is loading. Retry in a moment.","color":"yellow"}
scoreboard players set #de_el_count temp 0
execute store result score #de_el_count temp if entity @e[type=marker,tag=de_el_wall_marker]
execute if score #de_el_count temp matches 64.. run return run tellraw @s {"text":"[Electric Bow] The breakable wall supports up to 64 marked blocks.","color":"red"}
# Only append when every existing marker is loaded, avoiding snapshot-slot reuse.
execute if score @e[type=marker,tag=de_el_vane_marker,limit=1] de_el_walls matches 1.. unless score #de_el_count temp = @e[type=marker,tag=de_el_vane_marker,limit=1] de_el_walls run return run tellraw @s {"text":"[Electric Bow] Load every marked wall block before editing.","color":"red"}
scoreboard players set #de_el_sixteen temp 16
scoreboard players operation #de_el_sx temp = #de_el_count temp
scoreboard players operation #de_el_sx temp %= #de_el_sixteen temp
scoreboard players operation #de_el_sz temp = #de_el_count temp
scoreboard players operation #de_el_sz temp /= #de_el_sixteen temp
scoreboard players remove #de_el_sz temp 1024
execute summon marker run function zbk_der_eisendrache:quest/bows/electric/weather_vane/wall/marker/configure
execute if score #de_el_saved temp matches 0 run return run tellraw @s {"text":"[Electric Bow] Snapshot failed; no wall block was registered.","color":"red"}
scoreboard players set #de_el_count temp 0
execute store result score #de_el_count temp if entity @e[type=marker,tag=de_el_wall_marker]
scoreboard players operation @e[type=marker,tag=de_el_vane_marker,limit=1] de_el_walls = #de_el_count temp
particle minecraft:block_marker{block_state:{Name:"minecraft:stone_bricks"}} ~0.5 ~0.5 ~0.5 0 0 0 0 1 force @s
tellraw @s [{"text":"[Electric Bow] Wall block saved at ","color":"green"},{"nbt":"wall_position","storage":"zombies:de_electric_quest"},{"text":". This highlighted block will break. Repeat for each wall block."}]
