# Create bullet hole effect when hitting a solid block

# Smoke puff at impact point
particle minecraft:smoke ~ ~ ~ 0.1 0.1 0.1 0.01 5 force

# Small explosion particles for impact
particle minecraft:block{block_state:"minecraft:stone"} ~ ~ ~ 0.1 0.1 0.1 0.1 3 force
