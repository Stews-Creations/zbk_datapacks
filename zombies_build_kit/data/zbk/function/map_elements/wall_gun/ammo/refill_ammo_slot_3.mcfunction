# ===================================
# WALL GUN - REFILL AMMO SLOT 3
# ===================================
# Purpose: Refill reserve ammo for gun in slot 3
# ===================================

# Refill clip (magazine) to max
scoreboard players operation @s ammo_3 = @s max_ammo_3

# Refill reserve ammo to max
scoreboard players operation @s reserve_ammo_3 = @s max_reserve_3
