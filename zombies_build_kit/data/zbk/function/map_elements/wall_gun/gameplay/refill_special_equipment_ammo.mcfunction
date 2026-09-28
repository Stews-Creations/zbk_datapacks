# ===================================
# WALL GUN - REFILL SPECIAL EQUIPMENT AMMO
# ===================================
# Purpose: Refill monkey bomb or trip mine ammo to max capacity
# Called when player buys ammo at a special equipment wall buy
# ===================================

scoreboard players operation @s special_equipment_ammo = @s max_special_equipment_ammo
function zbk:player/inventory/special_equipment
