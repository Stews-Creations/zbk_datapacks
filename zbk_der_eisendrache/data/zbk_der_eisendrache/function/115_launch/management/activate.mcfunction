# ===================================
# 115 LAUNCH PAD - ACTIVATE
# ===================================
# Purpose: Start the 2-second countdown when a player enters range
# Executed as the start marker
# ===================================

execute unless score #active zbk.de matches 1 run return 0

# Set 2-second countdown (40 ticks)
scoreboard players set @s 115_launch_timer 40

# Play activation sound
execute at @s run playsound zbk_der_eisendrache:115.launch_start master @a ~ ~ ~ 1 1
