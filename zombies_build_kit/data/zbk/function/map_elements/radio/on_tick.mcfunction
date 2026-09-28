# ===================================
# RADIO MODULE - TICK
# ===================================
# Purpose: Detect placed radio spawn eggs (bats) and convert to prop

execute if entity @e[type=minecraft:bat,name="Radio"] run function zbk:map_elements/radio/spawning/spawn

# Detect melee hits on radio interaction (attack NBT is set when punched)
execute as @e[type=minecraft:interaction,tag=radio_interaction,nbt={attack:{}}] at @s run function zbk:map_elements/radio/gameplay/hit_melee
