# Fallback to original gun selection logic (allows duplicates)
# Used for edge case: player has 0 guns (any gun is valid)
# Context: @s = mystery_box_location marker

# Generate rarity-weighted reward and update display
function zombies:map_elements/mystery_box/guns/roll_reward

# Store the selected gun ID on the mystery box location marker
scoreboard players operation @s mystery_box_selected_gun = #gun_cycle temp
