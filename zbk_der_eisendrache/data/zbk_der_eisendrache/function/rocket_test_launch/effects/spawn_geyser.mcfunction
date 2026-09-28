# Spawn one complete Minecraft 26.2 geyser at the command source position.
# The full emitter creates the base, poof/top, and plume components.
execute unless score #active zbk.de matches 1 run return 0
particle minecraft:geyser{water_blocks:4} ~ ~ ~ 0 0 0 0 1 force
