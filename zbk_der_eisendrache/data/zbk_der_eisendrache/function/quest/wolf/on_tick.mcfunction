# Wolf painting quest tick function
# Called every tick to handle wolf painting behavior

# Detect wolf painting location marker eggs being placed
execute if entity @e[type=minecraft:wolf,name="Wolf Painting Location"] run function zbk_der_eisendrache:quest/wolf/spawning/spawn

# Add per-tick behavior here if needed (e.g., particle effects, player detection, etc.)
