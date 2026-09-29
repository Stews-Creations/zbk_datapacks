# Generated from tools/legacy_perk_layouts.json; coordinates relative to aligned marker.
execute positioned ~0.4375 ~2.3125 ~1.0625 run kill @e[type=text_display,tag=!pm_runtime,tag=!pm_v2_runtime,distance=..0.15,nbt={text:{text:"Mule Kick"}}]
execute positioned ~0.6875 ~0.0625 ~1.1875 run kill @e[type=marker,tag=!pm_runtime,tag=!pm_v2_runtime,distance=..0.15,tag=mule_bonus]
execute if block ~1 ~ ~ minecraft:green_wool run setblock ~1 ~ ~ air
execute if block ~ ~ ~ minecraft:green_wool run setblock ~ ~ ~ air
execute if block ~-1 ~ ~ minecraft:green_wool run setblock ~-1 ~ ~ air
execute if block ~1 ~1 ~ minecraft:white_terracotta run setblock ~1 ~1 ~ air
execute if block ~ ~1 ~ minecraft:white_terracotta run setblock ~ ~1 ~ air
execute if block ~-1 ~1 ~ minecraft:white_terracotta run setblock ~-1 ~1 ~ air
execute if block ~ ~2 ~ minecraft:crimson_planks run setblock ~ ~2 ~ air
execute if block ~ ~3 ~ minecraft:ochre_froglight run setblock ~ ~3 ~ air
execute if block ~1 ~ ~1 minecraft:warped_button run setblock ~1 ~ ~1 air
execute if block ~-1 ~ ~1 minecraft:warped_trapdoor run setblock ~-1 ~ ~1 air
execute if block ~ ~1 ~1 minecraft:warped_button run setblock ~ ~1 ~1 air
execute if block ~-1 ~1 ~1 minecraft:warped_trapdoor run setblock ~-1 ~1 ~1 air
execute if block ~1 ~2 ~ minecraft:crimson_stairs run setblock ~1 ~2 ~ air
execute if block ~-1 ~2 ~ minecraft:crimson_stairs run setblock ~-1 ~2 ~ air
execute if block ~1 ~1 ~1 minecraft:warped_wall_sign run setblock ~1 ~1 ~1 air
