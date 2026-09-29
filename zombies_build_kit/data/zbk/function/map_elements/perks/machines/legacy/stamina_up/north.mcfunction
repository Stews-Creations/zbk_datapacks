# Generated from tools/legacy_perk_layouts.json; coordinates relative to aligned marker.
execute positioned ~1 ~2.25 ~1.0625 run kill @e[type=text_display,tag=!pm_runtime,tag=!pm_v2_runtime,distance=..0.15,nbt={text:{text:"Stamina Up"}}]
execute positioned ~0.875 ~0.0625 ~1.125 run kill @e[type=marker,tag=!pm_runtime,tag=!pm_v2_runtime,distance=..0.15,tag=stamina_bonus]
execute if block ~1 ~ ~ minecraft:ochre_froglight run setblock ~1 ~ ~ air
execute if block ~ ~ ~ minecraft:ochre_froglight run setblock ~ ~ ~ air
execute if block ~1 ~1 ~ minecraft:orange_wool run setblock ~1 ~1 ~ air
execute if block ~ ~1 ~ minecraft:orange_wool run setblock ~ ~1 ~ air
execute if block ~1 ~2 ~ minecraft:ochre_froglight run setblock ~1 ~2 ~ air
execute if block ~ ~2 ~ minecraft:ochre_froglight run setblock ~ ~2 ~ air
execute if block ~1 ~ ~1 minecraft:acacia_trapdoor run setblock ~1 ~ ~1 air
execute if block ~ ~ ~1 minecraft:acacia_trapdoor run setblock ~ ~ ~1 air
execute if block ~1 ~1 ~1 minecraft:acacia_wall_sign run setblock ~1 ~1 ~1 air
execute if block ~ ~1 ~1 minecraft:acacia_wall_sign run setblock ~ ~1 ~1 air
