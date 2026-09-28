# Randomly cycle the mystery box gun display item model
# Used during the buy animation to show different guns cycling

# Generate a random visual reward for the spin animation.
# Final rewards use roll_reward.mcfunction for the rarity-weighted result.
execute store result score #gun_cycle temp run random value 17..46
function zbk:dispatch/extension/map_elements/mystery_box/guns/cycle_gun/1
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

function zbk:dispatch/extension/map_elements/mystery_box/guns/cycle_gun/2
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
execute as @e[type=item_display,tag=mystery_box_gun,distance=..1,limit=1,sort=nearest] run function zbk:map_elements/mystery_box/guns/display_selected_gun
