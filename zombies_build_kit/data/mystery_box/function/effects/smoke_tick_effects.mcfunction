# ===================================
# SMOKE TICK EFFECTS
# ===================================
# Spawns the actual particles for smoke effect
# Called every tick from smoke_tick (executed as marker, at marker position)
# Reads direction from entity NBT data
# ===================================

# Blue dust particles (using dust particle with blue color)
# Color: RGB(0.2, 0.4, 1.0) for a blue smoke effect

execute if entity @s[nbt={data:{direction:"north"}}] run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~-1 ~ 0.3 0.2 0.1 0 3 force
execute if entity @s[nbt={data:{direction:"south"}}] run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~-1 ~ 0.3 0.2 0.1 0 3 force
execute if entity @s[nbt={data:{direction:"east"}}] run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~-1 ~ 0.1 0.2 0.3 0 3 force
execute if entity @s[nbt={data:{direction:"west"}}] run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~-1 ~ 0.1 0.2 0.3 0 3 force

# Additional smoke clouds for thickness
execute if entity @s[nbt={data:{direction:"north"}}] run particle minecraft:smoke ~ ~ ~ 1.5 0.3 0.2 0.01 2 force
execute if entity @s[nbt={data:{direction:"south"}}] run particle minecraft:smoke ~ ~ ~ 1.5 0.3 0.2 0.01 2 force
execute if entity @s[nbt={data:{direction:"east"}}] run particle minecraft:smoke ~ ~ ~ 0.2 0.3 1.5 0.01 2 force
execute if entity @s[nbt={data:{direction:"west"}}] run particle minecraft:smoke ~ ~ ~ 0.2 0.3 1.5 0.01 2 force
