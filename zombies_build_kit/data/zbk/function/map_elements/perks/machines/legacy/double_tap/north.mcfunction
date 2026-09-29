# Generated from tools/legacy_perk_layouts.json; coordinates relative to aligned marker.
execute positioned ~1 ~2.25 ~1.0625 run kill @e[type=text_display,tag=!pm_runtime,tag=!pm_v2_runtime,distance=..0.15,nbt={text:{text:"Double Tap"}}]
execute positioned ~0.875 ~0.3125 ~0.875 run kill @e[type=marker,tag=!pm_runtime,tag=!pm_v2_runtime,distance=..0.15,tag=doubletap_bonus]
execute if block ~1 ~ ~ minecraft:ochre_froglight run setblock ~1 ~ ~ air
execute if block ~ ~ ~ minecraft:ochre_froglight run setblock ~ ~ ~ air
execute if block ~1 ~1 ~ minecraft:loom run setblock ~1 ~1 ~ air
execute if block ~ ~1 ~ minecraft:loom run setblock ~ ~1 ~ air
execute if block ~1 ~2 ~ minecraft:ochre_froglight run setblock ~1 ~2 ~ air
execute if block ~ ~2 ~ minecraft:ochre_froglight run setblock ~ ~2 ~ air
execute if block ~1 ~ ~1 minecraft:mangrove_trapdoor run setblock ~1 ~ ~1 air
execute if block ~ ~ ~1 minecraft:mangrove_trapdoor run setblock ~ ~ ~1 air
execute if block ~1 ~1 ~1 minecraft:oak_wall_sign run setblock ~1 ~1 ~1 air
execute if block ~ ~1 ~1 minecraft:oak_wall_sign run setblock ~ ~1 ~1 air
