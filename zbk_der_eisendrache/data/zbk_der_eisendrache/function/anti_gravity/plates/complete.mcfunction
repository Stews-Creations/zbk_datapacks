# Lock this plate until the map/game reset.
scoreboard players set @s de_ag_plate_t 60
tag @s add de_ag_plate_complete

function zbk_der_eisendrache:anti_gravity/plates/effects/burst
execute if block ~ ~-1 ~ minecraft:redstone_lamp run setblock ~ ~-1 ~ minecraft:redstone_lamp[lit=true]
execute if block ~ ~-1 ~ minecraft:redstone_lamp run function zbk_der_eisendrache:anti_gravity/plates/audio/complete
execute unless block ~ ~-1 ~ minecraft:redstone_lamp run tellraw @a[tag=de_ag_debug] [{"text":"[Anti-Gravity Plate] ","color":"light_purple"},{"text":"Completed plate has no redstone lamp one block beneath its marker.","color":"red"}]
