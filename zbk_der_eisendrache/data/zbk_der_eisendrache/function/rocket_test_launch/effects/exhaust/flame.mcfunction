# Broad engine core roughly 10 blocks above the floor anchor.
particle minecraft:dust{color:[1.0,0.85,0.15],scale:2.5} ~ ~10.0 ~ 2.8 0.25 2.8 0.03 8 force
particle minecraft:flame ~ ~9.5 ~ 2.8 0.45 2.8 0.10 12 force
particle minecraft:small_flame ~ ~8.0 ~ 2.5 1.2 2.5 0.12 10 force

# Layered downward plume through the large launch bay.
particle minecraft:flame ~ ~6.0 ~ 2.3 1.5 2.3 0.13 10 force
particle minecraft:dust{color:[1.0,0.35,0.02],scale:2.0} ~ ~5.5 ~ 2.1 1.5 2.1 0.06 6 force
particle minecraft:small_flame ~ ~3.0 ~ 1.8 1.6 1.8 0.12 7 force
particle minecraft:flame ~ ~1.2 ~ 1.5 0.8 1.5 0.10 5 force

# A few explicitly downward-moving particles make the exhaust direction readable.
particle minecraft:flame ~-2.0 ~9.5 ~-2.0 0 -1 0 0.9 0 force
particle minecraft:flame ~2.0 ~9.5 ~-2.0 0 -1 0 0.9 0 force
particle minecraft:flame ~-2.0 ~9.5 ~2.0 0 -1 0 0.9 0 force
particle minecraft:flame ~2.0 ~9.5 ~2.0 0 -1 0 0.9 0 force
particle minecraft:flame ~ ~9.5 ~ 0 -1 0 1.0 0 force
