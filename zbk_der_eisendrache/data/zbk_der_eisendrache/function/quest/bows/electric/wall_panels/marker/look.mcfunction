execute unless loaded ~ ~ ~ run return run tellraw @s {"text":"Load the wall before placing a panel.","color":"yellow"}
execute unless block ~ ~ ~ #zbk:raycast_pass run return run function zbk_der_eisendrache:quest/bows/electric/wall_panels/marker/face
scoreboard players add #de_ep_ray temp 1
execute if score #de_ep_ray temp matches ..80 positioned ^ ^ ^0.1 run return run function zbk_der_eisendrache:quest/bows/electric/wall_panels/marker/look
tellraw @s {"text":"Aim at a vertical wall block within 8 blocks.","color":"yellow"}
