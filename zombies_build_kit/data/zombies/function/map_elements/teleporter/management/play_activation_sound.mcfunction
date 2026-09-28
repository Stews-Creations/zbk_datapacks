# Executed as the linked start marker, positioned at the departure pad.
# Match the radius bands used by forward and return teleports.
scoreboard players set #tp_sound_radius teleporter_price 3
execute store result score #tp_sound_radius teleporter_price run data get entity @s data.radius 1
execute if score #tp_sound_radius teleporter_price matches ..3 as @a[distance=..3] at @s run function zombies:sounds/play/teleporter_buy
execute if score #tp_sound_radius teleporter_price matches 4 as @a[distance=..4] at @s run function zombies:sounds/play/teleporter_buy
execute if score #tp_sound_radius teleporter_price matches 5 as @a[distance=..5] at @s run function zombies:sounds/play/teleporter_buy
execute if score #tp_sound_radius teleporter_price matches 6 as @a[distance=..6] at @s run function zombies:sounds/play/teleporter_buy
execute if score #tp_sound_radius teleporter_price matches 7 as @a[distance=..7] at @s run function zombies:sounds/play/teleporter_buy
execute if score #tp_sound_radius teleporter_price matches 8.. as @a[distance=..8] at @s run function zombies:sounds/play/teleporter_buy
