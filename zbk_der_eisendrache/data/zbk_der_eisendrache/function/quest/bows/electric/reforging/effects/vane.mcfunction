# Eight times the normal 4.5-degree spin; only the head moves.
tag @s remove de_el_vane_spinning
tp @s ~ ~ ~ ~36 0
execute at @s positioned ^1.4 ^0.2 ^0 run particle minecraft:flame ~ ~ ~ 0.1 0.2 0.1 0.01 2 force @a[distance=..64]
execute at @s positioned ^-1.4 ^0.2 ^0 run particle minecraft:flame ~ ~ ~ 0.1 0.2 0.1 0.01 2 force @a[distance=..64]
execute at @s positioned ^0 ^0.2 ^1.4 run particle minecraft:electric_spark ~ ~ ~ 0.2 0.4 0.2 0.03 4 force @a[distance=..64]
execute at @s positioned ^0 ^0.2 ^-1.4 run particle minecraft:electric_spark ~ ~ ~ 0.2 0.4 0.2 0.03 4 force @a[distance=..64]
# Independent cadence while waiting for the click and throughout the ascent.
scoreboard players add #flash de_er_tick 1
scoreboard players set #flash_period de_er_tick 20
scoreboard players operation #flash de_er_tick %= #flash_period de_er_tick
execute if score #flash de_er_tick matches 0 at @s run particle minecraft:flash{color:[0.2,0.6,1.0,1.0]} ~ ~0.4 ~ 0.8 0.4 0.8 0 1 force @a[distance=..64]
