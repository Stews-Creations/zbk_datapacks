# ===================================
# 115 LAUNCH PAD - LAUNCH
# ===================================
# Purpose: Launch all players within range when countdown expires
# Executed as the start marker, at its position
# ===================================

execute unless score #active zbk.de matches 1 run return 0

# Play fly sound
playsound zbk_der_eisendrache:115.launch_fly master @a ~ ~ ~ 1 1

# Launch each player in range
execute as @a[distance=..2] run function zbk_der_eisendrache:115_launch/flight/start
