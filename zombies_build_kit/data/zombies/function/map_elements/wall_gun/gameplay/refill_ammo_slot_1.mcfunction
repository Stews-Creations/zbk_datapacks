# ===================================
# WALL GUN - REFILL AMMO SLOT 1
# ===================================
# Purpose: Refill reserve ammo for gun in slot 1
# ===================================

# Refill clip (magazine) to max
scoreboard players operation @s ammo_1 = @s max_ammo_1

# Refill reserve ammo to max
scoreboard players operation @s reserve_ammo_1 = @s max_reserve_1
