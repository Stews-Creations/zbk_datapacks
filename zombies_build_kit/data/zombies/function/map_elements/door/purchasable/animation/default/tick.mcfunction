# Context: selected door marker at its position, after the global timer increment.
# Use exact tick milestones so animation stages and collision changes occur only once.

execute if score @s door_anim_timer matches 5 run function zombies:map_elements/door/purchasable/animation/default/animate_down
execute if score @s door_anim_timer matches 10 run function zombies:map_elements/door/purchasable/animation/default/animate_down_2
execute if score @s door_anim_timer matches 15 run function zombies:map_elements/door/purchasable/animation/default/animate_down_3
execute if score @s door_anim_timer matches 20 run function zombies:map_elements/door/purchasable/animation/default/animate_down_4
