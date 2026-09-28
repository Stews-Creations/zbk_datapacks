# Remove only collision panes in this platform door's owned volume.
execute if entity @s[tag=tram_platform_door_north] run fill ~-2 ~ ~ ~1 ~1 ~ minecraft:air replace minecraft:magenta_stained_glass_pane
execute if entity @s[tag=tram_platform_door_south] run fill ~-2 ~ ~ ~1 ~1 ~ minecraft:air replace minecraft:magenta_stained_glass_pane
execute if entity @s[tag=tram_platform_door_east] run fill ~ ~ ~-2 ~ ~1 ~1 minecraft:air replace minecraft:magenta_stained_glass_pane
execute if entity @s[tag=tram_platform_door_west] run fill ~ ~ ~-2 ~ ~1 ~1 minecraft:air replace minecraft:magenta_stained_glass_pane
