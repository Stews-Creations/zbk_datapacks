# ===================================
# BOX PARTICLE EFFECT
# ===================================
# Spawns blue dust particles at mystery box locations
# Called every tick from main tick function
# Only runs for locations without the 'disabled' tag
# ===================================

# Blue dust particles (using dust particle with blue color)
# Color: RGB(0.2, 0.4, 1.0) for a blue smoke effect
# Position: 1.5 blocks below ground level
# Spawns in 3-block line: center, left, and right

# North/South: spread along X-axis (left-right)
execute if entity @s[tag=facing_north] positioned ~ ~1.5 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:1.0} ~ ~-1.5 ~ 0.3 0.2 0.1 0 1 force
execute if entity @s[tag=facing_north] positioned ~ ~1.5 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:1.0} ~-1 ~-1.5 ~ 0.3 0.2 0.1 0 1 force
execute if entity @s[tag=facing_north] positioned ~ ~1.5 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:1.0} ~1 ~-1.5 ~ 0.3 0.2 0.1 0 1 force

execute if entity @s[tag=facing_south] positioned ~ ~1.5 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:1.0} ~ ~-1.5 ~ 0.3 0.2 0.1 0 1 force
execute if entity @s[tag=facing_south] positioned ~ ~1.5 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:1.0} ~-1 ~-1.5 ~ 0.3 0.2 0.1 0 1 force
execute if entity @s[tag=facing_south] positioned ~ ~1.5 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:1.0} ~1 ~-1.5 ~ 0.3 0.2 0.1 0 1 force

# East/West: spread along Z-axis (left-right)
execute if entity @s[tag=facing_east] positioned ~ ~1.5 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:1.0} ~ ~-1.5 ~ 0.1 0.2 0.3 0 1 force
execute if entity @s[tag=facing_east] positioned ~ ~1.5 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:1.0} ~ ~-1.5 ~-1 0.1 0.2 0.3 0 1 force
execute if entity @s[tag=facing_east] positioned ~ ~1.5 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:1.0} ~ ~-1.5 ~1 0.1 0.2 0.3 0 1 force

execute if entity @s[tag=facing_west] positioned ~ ~1.5 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:1.0} ~ ~-1.5 ~ 0.1 0.2 0.3 0 1 force
execute if entity @s[tag=facing_west] positioned ~ ~1.5 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:1.0} ~ ~-1.5 ~-1 0.1 0.2 0.3 0 1 force
execute if entity @s[tag=facing_west] positioned ~ ~1.5 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:1.0} ~ ~-1.5 ~1 0.1 0.2 0.3 0 1 force
