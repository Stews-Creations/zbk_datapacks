# Generated from tools/legacy_perk_layouts.json; coordinates relative to aligned marker.
execute positioned ~-0.0625 ~2.25 ~0.5 run kill @e[type=text_display,tag=!pm_runtime,tag=!pm_v2_runtime,distance=..0.15,nbt={text:{text:"Speed Cola"}}]
execute positioned ~-0.0625 ~0.0625 ~1 run kill @e[type=marker,tag=!pm_runtime,tag=!pm_v2_runtime,distance=..0.15,tag=speed_bonus]
execute if block ~ ~ ~1 minecraft:green_wool run setblock ~ ~ ~1 air
execute if block ~ ~ ~ minecraft:green_wool run setblock ~ ~ ~ air
execute if block ~ ~1 ~1 minecraft:ochre_froglight run setblock ~ ~1 ~1 air
execute if block ~ ~1 ~ minecraft:green_wool run setblock ~ ~1 ~ air
execute if block ~ ~2 ~1 minecraft:ochre_froglight run setblock ~ ~2 ~1 air
execute if block ~ ~2 ~ minecraft:white_terracotta run setblock ~ ~2 ~ air
execute if block ~-1 ~1 ~ minecraft:warped_wall_sign run setblock ~-1 ~1 ~ air
