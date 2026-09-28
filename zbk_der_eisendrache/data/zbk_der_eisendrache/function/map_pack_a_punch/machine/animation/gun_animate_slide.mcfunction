# Der Eisendrache Pack-a-Punch gun slide-in animation.
# Same timing as the normal Pack-a-Punch, raised by 0.25 blocks.

execute as @e[type=item_display,distance=..3,tag=pap_gun_buyin,limit=1,sort=nearest] run data merge entity @s {interpolation_duration:35}
execute as @e[type=item_display,distance=..3,tag=pap_gun_buyin,limit=1,sort=nearest] run data modify entity @s start_interpolation set from entity @s Tick

execute as @e[type=item_display,distance=..3,tag=pap_gun_buyin,tag=pack_a_punch_gun_south,limit=1,sort=nearest] run data modify entity @s transformation.translation set value [0f,1.65f,0.5f]
execute as @e[type=item_display,distance=..3,tag=pap_gun_buyin,tag=pack_a_punch_gun_north,limit=1,sort=nearest] run data modify entity @s transformation.translation set value [0f,1.65f,-0.5f]
execute as @e[type=item_display,distance=..3,tag=pap_gun_buyin,tag=pack_a_punch_gun_east,limit=1,sort=nearest] run data modify entity @s transformation.translation set value [0.5f,1.65f,0f]
execute as @e[type=item_display,distance=..3,tag=pap_gun_buyin,tag=pack_a_punch_gun_west,limit=1,sort=nearest] run data modify entity @s transformation.translation set value [-0.5f,1.65f,0f]

execute as @e[type=item_display,distance=..3,tag=pap_gun_buyin,limit=1,sort=nearest] run tag @s remove pap_gun_buyin
