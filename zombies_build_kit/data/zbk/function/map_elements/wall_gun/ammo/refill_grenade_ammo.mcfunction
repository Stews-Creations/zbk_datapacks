# ===================================
# WALL GUN - REFILL GRENADE AMMO
# ===================================
# Purpose: Refill grenade ammo to max capacity
# Called when player buys ammo at a grenade wall buy (gun_id 13)
# ===================================

# Refill grenades to max capacity
scoreboard players operation @s grenade_ammo = @s max_grenade_ammo
