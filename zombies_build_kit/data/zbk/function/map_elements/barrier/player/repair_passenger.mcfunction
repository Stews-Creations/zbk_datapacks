# ===================================
# BARRIER PLAYER - REPAIR PASSENGER
# ===================================
# Purpose: Handle barrier repair progression by restoring passengers/parent
#
# Context: Executed as barrier marker at @s
# ===================================

# ===== FIND BOARDS_SPAWN MARKER =====
# Get the nearest boards_spawn marker to execute passenger operations there
tag @e[type=marker,tag=boards_spawn,distance=..3,limit=1,sort=nearest] add barrier_repairing

# ===== STATE 5 -> 0: RESTORE PASSENGERS =====
# For states going from 5->4, 4->3, 3->2, 2->1, 1->0, restore one passenger each time
execute if score @s barrier_state matches 0..4 at @e[type=marker,tag=barrier_repairing,limit=1] run function zbk:map_elements/barrier/management/restore_passenger
execute if score @s barrier_state matches 0..4 run playsound minecraft:block.wood.place block @a[distance=..10] ~ ~ ~ 1 1.2

# ===== STATE 6 -> 5: RESTORE PARENT =====
# When repairing from fully broken (state 6), restore the parent entity visibility
execute if score @s barrier_state matches 5 at @e[type=marker,tag=barrier_repairing,limit=1] run data merge entity @e[type=item_display,tag=barrier_parent,distance=..1,limit=1] {view_range:0.5f}
execute if score @s barrier_state matches 5 at @e[type=marker,tag=barrier_repairing,limit=1] run tag @e[type=item_display,tag=barrier_parent,distance=..1] remove barrier_hidden
execute if score @s barrier_state matches 5 run playsound minecraft:block.wood.place block @a[distance=..10] ~ ~ ~ 1 1.4

# ===== UPGRADE LIGHT BLOCKS (STATE 6->5 ONLY) =====
# When first board is repaired (state 6->5), replace light[level=5] with light[level=6] to block zombies
execute if score @s barrier_state matches 5 at @e[type=marker,tag=barrier_repairing,limit=1] run function zbk:map_elements/barrier/management/update_light_blocks

# ===== CLEAN UP TAGS =====
tag @e[type=marker,tag=barrier_repairing] remove barrier_repairing
