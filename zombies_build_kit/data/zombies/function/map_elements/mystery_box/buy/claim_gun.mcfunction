# Claim the gun from the mystery box
# This should be called by the player when they want to claim the gun
# Context: Player executing at nearest mystery box location

# Find nearest mystery box location
execute as @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] at @s run function zombies:map_elements/mystery_box/buy/claim_gun_validated
