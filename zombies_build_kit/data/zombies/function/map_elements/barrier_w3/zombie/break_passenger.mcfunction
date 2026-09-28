# ===================================
# BARRIER W3 ZOMBIE - BREAK PASSENGER
# ===================================
# Context: Executed as barrier_w3 marker at @s

# ===== FIND BOARDS_SPAWN MARKER =====
tag @e[type=marker,tag=boards_spawn_w3,distance=..3,limit=1,sort=nearest] add barrier_w3_breaking

# ===== STAGE 1-5: HIDE ONE PASSENGER =====
execute if score @s bw3_state matches 1..5 at @e[type=marker,tag=barrier_w3_breaking,limit=1] run function zombies:map_elements/barrier_w3/management/kill_passenger
execute if score @s bw3_state matches 1 run playsound minecraft:block.wood.break block @a[distance=..10] ~ ~ ~ 1 0.8
execute if score @s bw3_state matches 2 run playsound minecraft:block.wood.break block @a[distance=..10] ~ ~ ~ 1 0.7
execute if score @s bw3_state matches 3 run playsound minecraft:block.wood.break block @a[distance=..10] ~ ~ ~ 1 0.6
execute if score @s bw3_state matches 4 run playsound minecraft:block.wood.break block @a[distance=..10] ~ ~ ~ 1 0.5
execute if score @s bw3_state matches 5 run playsound minecraft:block.wood.break block @a[distance=..10] ~ ~ ~ 1 0.4

# ===== STAGE 6: HIDE PARENT (FULLY BROKEN) =====
execute if score @s bw3_state matches 6 at @e[type=marker,tag=barrier_w3_breaking,limit=1] run data merge entity @e[type=item_display,tag=barrier_w3_parent,distance=..1,limit=1] {view_range:0.0f}
execute if score @s bw3_state matches 6 at @e[type=marker,tag=barrier_w3_breaking,limit=1] run tag @e[type=item_display,tag=barrier_w3_parent,distance=..1] add barrier_w3_hidden
execute if score @s bw3_state matches 6 run playsound minecraft:entity.zombie.break_wooden_door block @a[distance=..10] ~ ~ ~ 1 1

# ===== REPLACE LIGHT BLOCKS (STATE 6 ONLY) =====
execute if score @s bw3_state matches 6 at @e[type=marker,tag=barrier_w3_breaking,limit=1] run function zombies:map_elements/barrier_w3/management/update_light_blocks

# ===== CLEAN UP TAGS =====
tag @e[type=marker,tag=barrier_w3_breaking] remove barrier_w3_breaking
