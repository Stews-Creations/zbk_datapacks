# ===================================
# WALL GUN - CHECK OWNERSHIP
# ===================================
# Purpose: Check if player owns the wall gun's weapon in any slot
# Input: #wall_gun_id temp (gun ID from wall gun marker)
# Output: #owns_wall_gun temp (1 if owned, 0 if not)
#         #owned_slot temp (1, 2, or 3) if owned
# ===================================

scoreboard players set #owns_wall_gun temp 0
scoreboard players set #owned_slot temp 0

# Check slot 1
execute if score @s gun_1 = #wall_gun_id temp run scoreboard players set #owns_wall_gun temp 1
execute if score @s gun_1 = #wall_gun_id temp run scoreboard players set #owned_slot temp 1

# Check slot 2
execute if score @s gun_2 = #wall_gun_id temp run scoreboard players set #owns_wall_gun temp 1
execute if score @s gun_2 = #wall_gun_id temp run scoreboard players set #owned_slot temp 2

# Check slot 3
execute if score @s gun_3 = #wall_gun_id temp run scoreboard players set #owns_wall_gun temp 1
execute if score @s gun_3 = #wall_gun_id temp run scoreboard players set #owned_slot temp 3

# Check special equipment wall buys
execute if score #wall_gun_id temp matches 14 if score @s special_equipment matches 1 run scoreboard players set #owns_wall_gun temp 1
execute if score #wall_gun_id temp matches 14 if score @s special_equipment matches 1 run scoreboard players set #owned_slot temp 4
execute if score #wall_gun_id temp matches 15 if score @s special_equipment matches 2 run scoreboard players set #owns_wall_gun temp 1
execute if score #wall_gun_id temp matches 15 if score @s special_equipment matches 2 run scoreboard players set #owned_slot temp 4
