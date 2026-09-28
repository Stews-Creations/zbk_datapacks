# Called as @s = the pack_a_punch_flag item_display.
# Tag so flag_down can find this flag 4s later (idempotent on re-buy).
tag @s add pap_flag_animating

# Quick snap (2-tick interpolation): tilt 90 deg via left_rotation + compensating translation.
data merge entity @s {interpolation_duration:2}
data modify entity @s start_interpolation set from entity @s Tick

# Per-direction "up" pose (left_rotation = q_dir * q_anim, translation = south's up rotated by q_dir)
execute if entity @s[tag=pack_a_punch_flag_south] run data modify entity @s transformation.left_rotation set value [0f,0f,0.7071068f,0.7071068f]
execute if entity @s[tag=pack_a_punch_flag_south] run data modify entity @s transformation.translation set value [-0.625f,0.78f,-0.67f]

execute if entity @s[tag=pack_a_punch_flag_north] run data modify entity @s transformation.left_rotation set value [0.7071068f,0.7071068f,0f,0f]
execute if entity @s[tag=pack_a_punch_flag_north] run data modify entity @s transformation.translation set value [0.625f,0.78f,0.67f]

execute if entity @s[tag=pack_a_punch_flag_east] run data modify entity @s transformation.left_rotation set value [0.5f,0.5f,0.5f,0.5f]
execute if entity @s[tag=pack_a_punch_flag_east] run data modify entity @s transformation.translation set value [-0.67f,0.78f,0.625f]

execute if entity @s[tag=pack_a_punch_flag_west] run data modify entity @s transformation.left_rotation set value [-0.5f,-0.5f,0.5f,0.5f]
execute if entity @s[tag=pack_a_punch_flag_west] run data modify entity @s transformation.translation set value [0.67f,0.78f,-0.625f]
