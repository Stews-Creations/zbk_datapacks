# Main coordinator for no-duplicate gun selection
# Context: @s = mystery_box_location marker
# Uses mystery_box_player_id to identify the buyer and check their inventory

# Get player ID from the mystery box marker
scoreboard players operation #player_id temp = @s mystery_box_player_id

# Count how many guns the player currently has
execute as @a if score @s id = #player_id temp store result score #gun_count temp run function zbk:map_elements/mystery_box/guns/selection/count_player_guns

# Edge case: Player has 0 guns - use fast path (any gun is valid, skip duplicate check)
execute if score #gun_count temp matches 0 run return run function zbk:map_elements/mystery_box/guns/selection/select_gun_allow_duplicate

# Normal case: Player has 1-3 guns - start reroll loop to find gun they don't have
scoreboard players set #attempts temp 0
function zbk:map_elements/mystery_box/guns/selection/select_gun_reroll_loop
