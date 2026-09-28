# Runs as a closed platform-door marker.
# Use a two-block-high pane wall so players cannot jump over the visual gate.
execute unless score #active zbk.de matches 1 run return 0
execute if entity @s[tag=tram_platform_door_north] run fill ~-2 ~ ~ ~1 ~1 ~ minecraft:magenta_stained_glass_pane keep
execute if entity @s[tag=tram_platform_door_south] run fill ~-2 ~ ~ ~1 ~1 ~ minecraft:magenta_stained_glass_pane keep
execute if entity @s[tag=tram_platform_door_east] run fill ~ ~ ~-2 ~ ~1 ~1 minecraft:magenta_stained_glass_pane keep
execute if entity @s[tag=tram_platform_door_west] run fill ~ ~ ~-2 ~ ~1 ~1 minecraft:magenta_stained_glass_pane keep
