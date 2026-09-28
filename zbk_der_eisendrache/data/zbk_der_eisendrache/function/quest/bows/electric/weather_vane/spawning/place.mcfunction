# One persistent vane location per map, with the executing position and heading.
execute unless score #active zbk.de matches 1 run return run tellraw @s {"text":"[Electric Bow] Select Der Eisendrache (Der Eisendrache) before placing the vane.","color":"red"}
execute unless dimension minecraft:overworld run return run tellraw @s {"text":"[Electric Bow] Place the Der Eisendrache vane in the overworld.","color":"red"}
execute if entity @e[type=marker,tag=de_el_vane_marker] run return run tellraw @s {"text":"[Electric Bow] A vane is already placed. Delete it before placing another.","color":"yellow"}
summon marker ~ ~ ~ {Tags:["de_el_vane_marker"]}
tp @e[type=marker,tag=de_el_vane_marker,limit=1,sort=nearest] ~ ~ ~ ~ 0
function zbk_der_eisendrache:quest/bows/electric/weather_vane/initialize
tellraw @s {"text":"[Electric Bow] Weather vane placed. Its position will survive reloads and map changes.","color":"green"}
