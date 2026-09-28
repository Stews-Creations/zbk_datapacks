# ===================================
# WALL GUN - REFILL AMMO SLOT 2
# ===================================
# Purpose: Refill reserve ammo for gun in slot 2
# ===================================

# Refill clip (magazine) to max
scoreboard players operation @s ammo_2 = @s max_ammo_2

# Refill reserve ammo to max
scoreboard players operation @s reserve_ammo_2 = @s max_reserve_2
