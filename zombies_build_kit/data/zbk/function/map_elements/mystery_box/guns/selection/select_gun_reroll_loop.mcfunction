# Recursive reroll loop - generates random reward and checks if player has it
# Context: @s = mystery_box_location marker
# Max 50 attempts to find a gun the player doesn't have

# Generate rarity-weighted box reward and update the display
function zbk:map_elements/mystery_box/guns/selection/roll_reward

# Check if the player already has this gun
function zbk:map_elements/mystery_box/guns/selection/check_player_has_gun

# Increment attempt counter
scoreboard players add #attempts temp 1

# If player HAS this gun AND we haven't exceeded 50 attempts, try again
execute if score #has_gun temp matches 1 if score #attempts temp matches ..50 run return run function zbk:map_elements/mystery_box/guns/selection/select_gun_reroll_loop

# Success: Found valid gun (has_gun = 0) OR max attempts reached
# Store the selected gun ID on the mystery box location marker
scoreboard players operation @s mystery_box_selected_gun = #gun_cycle temp
