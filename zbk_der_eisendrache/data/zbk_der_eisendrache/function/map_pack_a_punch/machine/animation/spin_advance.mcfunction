# Advance the Der Eisendrache Pack-a-Punch rotaters by one 45-degree X-axis spin step.

scoreboard players set #de_pack_a_punch_spin_tick pack_a_punch 0
scoreboard players add #de_pack_a_punch_spin_step pack_a_punch 1
execute if score #de_pack_a_punch_spin_step pack_a_punch matches 8.. run scoreboard players set #de_pack_a_punch_spin_step pack_a_punch 0

execute as @e[type=item_display,tag=de_pack_a_punch_rotaters] run data modify entity @s start_interpolation set from entity @s Tick

# Step 0: 0 degrees
execute if score #de_pack_a_punch_spin_step pack_a_punch matches 0 as @e[type=item_display,tag=de_pack_a_punch_rotaters] run data modify entity @s transformation.left_rotation set value [0.0000000f,0f,0f,1.0000000f]
# Step 1: 45 degrees
execute if score #de_pack_a_punch_spin_step pack_a_punch matches 1 as @e[type=item_display,tag=de_pack_a_punch_rotaters] run data modify entity @s transformation.left_rotation set value [0.3826834f,0f,0f,0.9238795f]
# Step 2: 90 degrees
execute if score #de_pack_a_punch_spin_step pack_a_punch matches 2 as @e[type=item_display,tag=de_pack_a_punch_rotaters] run data modify entity @s transformation.left_rotation set value [0.7071068f,0f,0f,0.7071068f]
# Step 3: 135 degrees
execute if score #de_pack_a_punch_spin_step pack_a_punch matches 3 as @e[type=item_display,tag=de_pack_a_punch_rotaters] run data modify entity @s transformation.left_rotation set value [0.9238795f,0f,0f,0.3826834f]
# Step 4: 180 degrees
execute if score #de_pack_a_punch_spin_step pack_a_punch matches 4 as @e[type=item_display,tag=de_pack_a_punch_rotaters] run data modify entity @s transformation.left_rotation set value [1.0000000f,0f,0f,0.0000000f]
# Step 5: 225 degrees
execute if score #de_pack_a_punch_spin_step pack_a_punch matches 5 as @e[type=item_display,tag=de_pack_a_punch_rotaters] run data modify entity @s transformation.left_rotation set value [0.9238795f,0f,0f,-0.3826834f]
# Step 6: 270 degrees
execute if score #de_pack_a_punch_spin_step pack_a_punch matches 6 as @e[type=item_display,tag=de_pack_a_punch_rotaters] run data modify entity @s transformation.left_rotation set value [0.7071068f,0f,0f,-0.7071068f]
# Step 7: 315 degrees
execute if score #de_pack_a_punch_spin_step pack_a_punch matches 7 as @e[type=item_display,tag=de_pack_a_punch_rotaters] run data modify entity @s transformation.left_rotation set value [0.3826834f,0f,0f,-0.9238795f]
