# ===================================
# DR MONTY RADIO - TICK
# ===================================
# Purpose: Detect placed spawn eggs and melee hits

execute if entity @e[type=minecraft:bat,name="Dr Monty Radio"] run function zbk_nacht_der_untoten:dr_monty_radio/spawning/spawn

# Detect melee hits on interaction (attack NBT is set when punched)
execute as @e[type=minecraft:interaction,tag=zbk_nacht_radio_interaction,nbt={attack:{}}] at @s run function zbk_nacht_der_untoten:dr_monty_radio/interactions/hit_melee
