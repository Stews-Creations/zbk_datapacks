# === EMPTY INACTIVE BOXES ===
# Called after initialization to ensure all inactive boxes show empty animation
# This cleans up any boxes that were left in a spawned visual state

# Play empty animation on all boxes where mystery_box_active = 0
execute as @e[tag=mystery_box_location,type=marker,scores={mystery_box_active=0}] at @s run function zombies:map_elements/mystery_box/animation/triggers/empty
