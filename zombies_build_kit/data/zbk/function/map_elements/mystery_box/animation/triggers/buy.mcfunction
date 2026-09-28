# Play buy animation based on nearest marker's facing direction
# Call this function near a mystery box to trigger buy animation
# Will validate conditions before playing

# Find nearest marker and run validated buy
execute as @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] at @s run function zbk:map_elements/mystery_box/animation/triggers/buy_validated
