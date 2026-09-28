# Validate if empty animation can be played
# Empty can only play when box is NOT active

# Check if box is inactive (not active)
execute unless score @s mystery_box_active matches 1 run return 1

# Box is active, cannot play empty
return 0
