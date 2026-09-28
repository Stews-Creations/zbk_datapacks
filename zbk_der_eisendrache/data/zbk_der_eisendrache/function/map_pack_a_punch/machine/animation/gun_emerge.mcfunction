# Der Eisendrache Pack-a-Punch gun emerge animation.
# Same timing/glint as the normal Pack-a-Punch, raised by 0.25 blocks.

execute as @e[type=item_display,distance=..3,tag=pack_a_punch_gun_display,limit=1,sort=nearest] run data modify entity @s item.components."minecraft:enchantment_glint_override" set value 1b

execute as @e[type=item_display,distance=..3,tag=pack_a_punch_gun_display,limit=1,sort=nearest] run data merge entity @s {interpolation_duration:40}
execute as @e[type=item_display,distance=..3,tag=pack_a_punch_gun_display,limit=1,sort=nearest] run data modify entity @s start_interpolation set from entity @s Tick

execute as @e[type=item_display,distance=..3,tag=pack_a_punch_gun_display,tag=pack_a_punch_gun_south,limit=1,sort=nearest] run data modify entity @s transformation.translation set value [0f,1.65f,-0.7f]
execute as @e[type=item_display,distance=..3,tag=pack_a_punch_gun_display,tag=pack_a_punch_gun_north,limit=1,sort=nearest] run data modify entity @s transformation.translation set value [0f,1.65f,0.7f]
execute as @e[type=item_display,distance=..3,tag=pack_a_punch_gun_display,tag=pack_a_punch_gun_east,limit=1,sort=nearest] run data modify entity @s transformation.translation set value [-0.7f,1.65f,0f]
execute as @e[type=item_display,distance=..3,tag=pack_a_punch_gun_display,tag=pack_a_punch_gun_west,limit=1,sort=nearest] run data modify entity @s transformation.translation set value [0.7f,1.65f,0f]
