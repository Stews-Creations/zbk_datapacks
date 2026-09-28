# Apply the display model for the reward in #gun_cycle temp.
# Context: @s = mystery_box_gun item_display

# Reset the render context so box-only display tweaks do not stick to the next reward.
data merge entity @s {item_display:"none"}

execute if score #gun_cycle temp matches 1 run data merge entity @s {item:{id:"minecraft:stick",count:1,components:{"minecraft:item_model":"zbk:double_barrel_shotgun"}}}
execute if score #gun_cycle temp matches 2 run data merge entity @s {item:{id:"minecraft:stick",count:1,components:{"minecraft:item_model":"zbk:flame_thrower"}}}
execute if score #gun_cycle temp matches 3 run data merge entity @s {item:{id:"minecraft:stick",count:1,components:{"minecraft:item_model":"zbk:grenade_launcher"}}}
execute if score #gun_cycle temp matches 4 run data merge entity @s {item:{id:"minecraft:stick",count:1,components:{"minecraft:item_model":"zbk:light_machine_gun"}}}
execute if score #gun_cycle temp matches 5 run data merge entity @s {item:{id:"minecraft:stick",count:1,components:{"minecraft:item_model":"zbk:pistol"}}}
execute if score #gun_cycle temp matches 6 run data merge entity @s {item:{id:"minecraft:stick",count:1,components:{"minecraft:item_model":"zbk:rainbow_rifle"}}}
execute if score #gun_cycle temp matches 7 run data merge entity @s {item:{id:"minecraft:stick",count:1,components:{"minecraft:item_model":"zbk:ray_gun"}}}
execute if score #gun_cycle temp matches 8 run data merge entity @s {item:{id:"minecraft:stick",count:1,components:{"minecraft:item_model":"zbk:rifle"}}}
execute if score #gun_cycle temp matches 9 run data merge entity @s {item:{id:"minecraft:stick",count:1,components:{"minecraft:item_model":"zbk:shotgun"}}}
execute if score #gun_cycle temp matches 10 run data merge entity @s {item:{id:"minecraft:stick",count:1,components:{"minecraft:item_model":"zbk:sniper"}}}
execute if score #gun_cycle temp matches 14 run data merge entity @s {item:{id:"minecraft:slime_ball",count:1,components:{"minecraft:item_model":"zbk:monkey_bomb_box"}}}
execute if score #gun_cycle temp matches 15 run data merge entity @s {item:{id:"minecraft:slime_ball",count:1,components:{"minecraft:item_model":"zbk:trip_mine_box"}}}

# BO3 integration
function zombies:combat/weapons/guns/bo3/registry/display_box
