# ===================================
# BARRIER ZOMBIE - BREAK PASSENGER
# ===================================
# Purpose: Handle barrier breaking progression by killing passengers
#
# Context: Executed as barrier marker at @s
# ===================================

# ===== FIND BOARDS_SPAWN MARKER =====
# Get the nearest boards_spawn marker to execute passenger operations there
tag @e[type=marker,tag=boards_spawn,distance=..3,limit=1,sort=nearest] add barrier_breaking

# ===== STAGE 1-5: HIDE ONE PASSENGER =====
# For states 0->1, 1->2, 2->3, 3->4, 4->5, kill one passenger
execute if score @s barrier_state matches 1..5 at @e[type=marker,tag=barrier_breaking,limit=1] run function zombies:map_elements/barrier/management/kill_passenger
execute if score @s barrier_state matches 1 run playsound minecraft:block.wood.break block @a[distance=..10] ~ ~ ~ 1 0.8
execute if score @s barrier_state matches 2 run playsound minecraft:block.wood.break block @a[distance=..10] ~ ~ ~ 1 0.7
execute if score @s barrier_state matches 3 run playsound minecraft:block.wood.break block @a[distance=..10] ~ ~ ~ 1 0.6
execute if score @s barrier_state matches 4 run playsound minecraft:block.wood.break block @a[distance=..10] ~ ~ ~ 1 0.5
execute if score @s barrier_state matches 5 run playsound minecraft:block.wood.break block @a[distance=..10] ~ ~ ~ 1 0.4

# ===== STAGE 6: HIDE PARENT (FULLY BROKEN) =====
# When state reaches 6, hide the parent entity (all passengers already hidden)
execute if score @s barrier_state matches 6 at @e[type=marker,tag=barrier_breaking,limit=1] run data merge entity @e[type=item_display,tag=barrier_parent,distance=..1,limit=1] {view_range:0.0f}
execute if score @s barrier_state matches 6 at @e[type=marker,tag=barrier_breaking,limit=1] run tag @e[type=item_display,tag=barrier_parent,distance=..1] add barrier_hidden
execute if score @s barrier_state matches 6 run playsound minecraft:entity.zombie.break_wooden_door block @a[distance=..10] ~ ~ ~ 1 1

# ===== REPLACE LIGHT BLOCKS (STATE 6 ONLY) =====
# When fully broken (state 6), replace light[level=6] with light[level=5] to allow zombies through
execute if score @s barrier_state matches 6 at @e[type=marker,tag=barrier_breaking,limit=1] run function zombies:map_elements/barrier/management/update_light_blocks

# ===== CLEAN UP TAGS =====
tag @e[type=marker,tag=barrier_breaking] remove barrier_breaking
