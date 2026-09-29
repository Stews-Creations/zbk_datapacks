# Generated from tools/legacy_perk_layouts.json; coordinates relative to aligned marker.
execute positioned ~ ~1.1875 ~0.5 run kill @e[type=text_display,tag=!pm_runtime,tag=!pm_v2_runtime,distance=..0.15,tag=quick_revive_text]
execute positioned ~-0.0625 ~0.0625 ~0.5 run kill @e[type=marker,tag=!pm_runtime,tag=!pm_v2_runtime,distance=..0.15,tag=revive_bonus]
execute if block ~ ~ ~1 minecraft:light_blue_wool run setblock ~ ~ ~1 air
execute if block ~ ~ ~ minecraft:white_wool run setblock ~ ~ ~ air
execute if block ~ ~ ~-1 minecraft:light_blue_wool run setblock ~ ~ ~-1 air
execute if block ~ ~1 ~ minecraft:ochre_froglight run setblock ~ ~1 ~ air
execute if block ~ ~1 ~1 minecraft:pale_oak_trapdoor run setblock ~ ~1 ~1 air
execute if block ~ ~1 ~-1 minecraft:pale_oak_trapdoor run setblock ~ ~1 ~-1 air
execute if block ~-1 ~ ~ minecraft:warped_wall_sign run setblock ~-1 ~ ~ air
