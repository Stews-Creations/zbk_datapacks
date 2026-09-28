# Context: selected door marker at its position, after the global timer increment.
# Use exact tick milestones so animation stages and collision changes occur only once.

execute if score @s door_anim_timer matches 5 run function zbk:map_elements/door/purchasable/animation/gate/animate_up_1
execute if score @s door_anim_timer matches 10 run function zbk:map_elements/door/purchasable/animation/gate/animate_up_2
execute if score @s door_anim_timer matches 15 run function zbk:map_elements/door/purchasable/animation/gate/animate_up_3
execute if score @s door_anim_timer matches 20 run function zbk:map_elements/door/purchasable/animation/gate/animate_up_4
execute if score @s door_anim_timer matches 25 run function zbk:map_elements/door/purchasable/animation/gate/animate_up_5
