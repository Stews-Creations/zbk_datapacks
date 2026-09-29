# Generated from tools/legacy_perk_layouts.json; coordinates relative to aligned marker.
execute positioned ~0.5 ~2.25 ~1 run kill @e[type=text_display,tag=!pm_runtime,tag=!pm_v2_runtime,distance=..0.15,nbt={text:{text:"Jugger-Nog"}}]
execute positioned ~0.5625 ~0.25 ~1.4375 run kill @e[type=marker,tag=!pm_runtime,tag=!pm_v2_runtime,distance=..0.15,tag=juggernog_bonus]
execute if block ~ ~ ~ minecraft:redstone_block run setblock ~ ~ ~ air
execute if block ~ ~1 ~ minecraft:red_wool run setblock ~ ~1 ~ air
execute if block ~ ~2 ~ minecraft:ochre_froglight run setblock ~ ~2 ~ air
execute if block ~1 ~ ~ minecraft:mangrove_trapdoor run setblock ~1 ~ ~ air
execute if block ~-1 ~ ~ minecraft:mangrove_trapdoor run setblock ~-1 ~ ~ air
execute if block ~ ~ ~1 minecraft:mangrove_trapdoor run setblock ~ ~ ~1 air
execute if block ~ ~1 ~1 minecraft:mangrove_wall_sign run setblock ~ ~1 ~1 air
