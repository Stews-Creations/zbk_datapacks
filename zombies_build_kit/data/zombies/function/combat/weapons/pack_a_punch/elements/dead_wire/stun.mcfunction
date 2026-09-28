# Stun a Dead Wire overflow victim (10th+ in radius).
# Run as @s = victim piglin. No kill, no points.

execute if entity @s[tag=immune_elements] run return 0

# Slowness V + Glowing for 3 seconds (60 ticks)
effect give @s minecraft:slowness 3 4 true
effect give @s minecraft:glowing 3 0 true

# Electric crackle on body
particle minecraft:electric_spark ~ ~1 ~ 0.3 0.5 0.3 0.3 12 force
