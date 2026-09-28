# Emit only above a non-air Y 79 block whose Y 80 space is air.
$execute positioned $(x) 80 $(z) unless block ~ ~-1 ~ minecraft:air if block ~ ~ ~ minecraft:air run particle minecraft:geyser_base{water_blocks:4,burst_impulse_base:1.0} ~0.5 ~0.10 ~0.5 0 0 0 0 1 force
