execute unless block ~ ~-0.01 ~ minecraft:air unless block ~ ~-0.01 ~ minecraft:cave_air unless block ~ ~-0.01 ~ minecraft:void_air unless block ~ ~-0.01 ~ minecraft:structure_void run scoreboard players set #de_ep_solid temp 1
execute if block ~ ~-0.01 ~ minecraft:barrier run scoreboard players set #de_ep_exempt temp 1
execute if block ~ ~-0.01 ~ minecraft:light run scoreboard players set #de_ep_exempt temp 1
execute if block ~ ~-0.01 ~ minecraft:lantern run scoreboard players set #de_ep_exempt temp 1
execute if block ~ ~-0.01 ~ minecraft:soul_lantern run scoreboard players set #de_ep_exempt temp 1
# Fences, walls and closed gates extend half a block above their block cell.
execute if block ~ ~-0.51 ~ #minecraft:fences run scoreboard players set #de_ep_solid temp 1
execute if block ~ ~-0.51 ~ #minecraft:walls run scoreboard players set #de_ep_solid temp 1
execute if block ~ ~-0.51 ~ #minecraft:fence_gates[open=false] run scoreboard players set #de_ep_solid temp 1
