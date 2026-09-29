# Check if a specific player has a specific gun ID in any of their 3 slots
# Input: #gun_cycle temp (box reward ID to check)
# Input: #player_id temp (player ID to check)
# Output: #has_gun temp (1 if player has this gun, 0 if they don't)

# Default to player not having the gun
scoreboard players set #has_gun temp 0

# Check if player has this gun in slot 1
execute as @a if score @s id = #player_id temp if score @s gun_1 = #gun_cycle temp run scoreboard players set #has_gun temp 1

# Check if player has this gun in slot 2
execute as @a if score @s id = #player_id temp if score @s gun_2 = #gun_cycle temp run scoreboard players set #has_gun temp 1

# Check if player has this gun in slot 3
execute as @a if score @s id = #player_id temp if score @s gun_3 = #gun_cycle temp run scoreboard players set #has_gun temp 1
