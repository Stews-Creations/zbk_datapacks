# ===================================
# PACK-A-PUNCH - SPIN ADVANCE
# ===================================
# X-axis rotation via left_rotation, with animated translation so the
# pivot stays at the entity position. Pivot in model space: (0, -0.25, 0).
# Formula: T(theta) = (0, 0.25*cos(theta), 0.25*sin(theta))
# ===================================

scoreboard players set #pap_spin_tick pack_a_punch 0
scoreboard players add #pap_spin_step pack_a_punch 1
execute if score #pap_spin_step pack_a_punch matches 8.. run scoreboard players set #pap_spin_step pack_a_punch 0

# Trigger interpolation on all rotaters
execute as @e[type=item_display,tag=pack_a_punch_rotaters] run data modify entity @s start_interpolation set from entity @s Tick

# Step 0: 0 degrees
execute if score #pap_spin_step pack_a_punch matches 0 as @e[type=item_display,tag=pack_a_punch_rotaters] run data modify entity @s transformation.left_rotation set value [0.0000000f,0f,0f,1.0000000f]
execute if score #pap_spin_step pack_a_punch matches 0 as @e[type=item_display,tag=pack_a_punch_rotaters] run data modify entity @s transformation.translation set value [0f,0.2500000f,0.0000000f]
# Step 1: 45 degrees
execute if score #pap_spin_step pack_a_punch matches 1 as @e[type=item_display,tag=pack_a_punch_rotaters] run data modify entity @s transformation.left_rotation set value [0.3826834f,0f,0f,0.9238795f]
execute if score #pap_spin_step pack_a_punch matches 1 as @e[type=item_display,tag=pack_a_punch_rotaters] run data modify entity @s transformation.translation set value [0f,0.1767767f,0.1767767f]
# Step 2: 90 degrees
execute if score #pap_spin_step pack_a_punch matches 2 as @e[type=item_display,tag=pack_a_punch_rotaters] run data modify entity @s transformation.left_rotation set value [0.7071068f,0f,0f,0.7071068f]
execute if score #pap_spin_step pack_a_punch matches 2 as @e[type=item_display,tag=pack_a_punch_rotaters] run data modify entity @s transformation.translation set value [0f,0.0000000f,0.2500000f]
# Step 3: 135 degrees
execute if score #pap_spin_step pack_a_punch matches 3 as @e[type=item_display,tag=pack_a_punch_rotaters] run data modify entity @s transformation.left_rotation set value [0.9238795f,0f,0f,0.3826834f]
execute if score #pap_spin_step pack_a_punch matches 3 as @e[type=item_display,tag=pack_a_punch_rotaters] run data modify entity @s transformation.translation set value [0f,-0.1767767f,0.1767767f]
# Step 4: 180 degrees
execute if score #pap_spin_step pack_a_punch matches 4 as @e[type=item_display,tag=pack_a_punch_rotaters] run data modify entity @s transformation.left_rotation set value [1.0000000f,0f,0f,0.0000000f]
execute if score #pap_spin_step pack_a_punch matches 4 as @e[type=item_display,tag=pack_a_punch_rotaters] run data modify entity @s transformation.translation set value [0f,-0.2500000f,0.0000000f]
# Step 5: 225 degrees
execute if score #pap_spin_step pack_a_punch matches 5 as @e[type=item_display,tag=pack_a_punch_rotaters] run data modify entity @s transformation.left_rotation set value [0.9238795f,0f,0f,-0.3826834f]
execute if score #pap_spin_step pack_a_punch matches 5 as @e[type=item_display,tag=pack_a_punch_rotaters] run data modify entity @s transformation.translation set value [0f,-0.1767767f,-0.1767767f]
# Step 6: 270 degrees
execute if score #pap_spin_step pack_a_punch matches 6 as @e[type=item_display,tag=pack_a_punch_rotaters] run data modify entity @s transformation.left_rotation set value [0.7071068f,0f,0f,-0.7071068f]
execute if score #pap_spin_step pack_a_punch matches 6 as @e[type=item_display,tag=pack_a_punch_rotaters] run data modify entity @s transformation.translation set value [0f,-0.0000000f,-0.2500000f]
# Step 7: 315 degrees
execute if score #pap_spin_step pack_a_punch matches 7 as @e[type=item_display,tag=pack_a_punch_rotaters] run data modify entity @s transformation.left_rotation set value [0.3826834f,0f,0f,-0.9238795f]
execute if score #pap_spin_step pack_a_punch matches 7 as @e[type=item_display,tag=pack_a_punch_rotaters] run data modify entity @s transformation.translation set value [0f,0.1767767f,-0.1767767f]
