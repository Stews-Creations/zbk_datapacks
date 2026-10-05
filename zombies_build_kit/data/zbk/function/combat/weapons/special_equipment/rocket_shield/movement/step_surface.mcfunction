# Called at each destination footprint sample before trying raised landings.
execute if block ~ ~ ~ minecraft:snow run scoreboard players set #rs_thin_floor temp 1
execute if block ~ ~ ~ #minecraft:trapdoors[open=false,half=bottom] run scoreboard players set #rs_thin_floor temp 1
execute if block ~ ~ ~ #minecraft:slabs run scoreboard players set #rs_full_step temp 1
execute if block ~ ~ ~ #minecraft:stairs run scoreboard players set #rs_full_step temp 1
execute if block ~ ~ ~ #minecraft:trapdoors[open=false,half=top] run scoreboard players set #rs_full_step temp 1
