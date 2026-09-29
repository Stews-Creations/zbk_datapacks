# Apply the display model for the reward in #gun_cycle temp.
# Context: @s = mystery_box_gun item_display

# Reset the render context so box-only display tweaks do not stick to the next reward.
data merge entity @s {item_display:"none"}

execute if score #gun_cycle temp matches 7 run data merge entity @s {item:{id:"minecraft:stick",count:1,components:{"minecraft:item_model":"zbk:guns/wonder_weapons/ray_gun"}}}
execute if score #gun_cycle temp matches 14 run data merge entity @s {item:{id:"minecraft:slime_ball",count:1,components:{"minecraft:item_model":"zbk:special_equipment/monkey_bomb/monkey_bomb_box"}}}
execute if score #gun_cycle temp matches 15 run data merge entity @s {item:{id:"minecraft:slime_ball",count:1,components:{"minecraft:item_model":"zbk:special_equipment/trip_mine/trip_mine_box"}}}

# BO3 integration
function zbk:combat/weapons/guns/bo3/registry/display_box
