# Bound display visibility in player-facing vanilla dimensions, including newly loaded entities.
execute in minecraft:overworld run function zombies:global/rendering/scan_dimension
execute in minecraft:the_nether run function zombies:global/rendering/scan_dimension
execute in minecraft:the_end run function zombies:global/rendering/scan_dimension
