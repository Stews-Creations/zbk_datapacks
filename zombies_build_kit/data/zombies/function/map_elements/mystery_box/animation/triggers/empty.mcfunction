# Play empty animation based on nearest marker's facing direction
# Call this function near a mystery box to trigger empty animation
# Will validate conditions before playing

# Find nearest marker and run validated empty
execute as @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] at @s run function zombies:map_elements/mystery_box/animation/triggers/empty_validated
