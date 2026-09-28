# Called from flag_down with @s = the PaP marker, at @s. Adds the PaP'd glint to this
# machine's gun and animates it back out of the machine to the "outside" (purchase text)
# position over 2s. Targets only the gun within 3 blocks of the calling marker.

# PaP'd visual: enchantment glint override
execute as @e[type=item_display,distance=..3,tag=pack_a_punch_gun_display,limit=1,sort=nearest] run data modify entity @s item.components."minecraft:enchantment_glint_override" set value 1b

# 2s slide back out
execute as @e[type=item_display,distance=..3,tag=pack_a_punch_gun_display,limit=1,sort=nearest] run data merge entity @s {interpolation_duration:40}
execute as @e[type=item_display,distance=..3,tag=pack_a_punch_gun_display,limit=1,sort=nearest] run data modify entity @s start_interpolation set from entity @s Tick

execute as @e[type=item_display,distance=..3,tag=pack_a_punch_gun_display,tag=pack_a_punch_gun_south,limit=1,sort=nearest] run data modify entity @s transformation.translation set value [0f,1.15f,-0.7f]
execute as @e[type=item_display,distance=..3,tag=pack_a_punch_gun_display,tag=pack_a_punch_gun_north,limit=1,sort=nearest] run data modify entity @s transformation.translation set value [0f,1.15f,0.7f]
execute as @e[type=item_display,distance=..3,tag=pack_a_punch_gun_display,tag=pack_a_punch_gun_east,limit=1,sort=nearest] run data modify entity @s transformation.translation set value [-0.7f,1.15f,0f]
execute as @e[type=item_display,distance=..3,tag=pack_a_punch_gun_display,tag=pack_a_punch_gun_west,limit=1,sort=nearest] run data modify entity @s transformation.translation set value [0.7f,1.15f,0f]
