# ===================================
# BARRIER W3 PLAYER - REPAIR PASSENGER
# ===================================
# Context: Executed as barrier_w3 marker at @s

# ===== FIND BOARDS_SPAWN MARKER =====
tag @e[type=marker,tag=boards_spawn_w3,distance=..3,limit=1,sort=nearest] add barrier_w3_repairing

# ===== STATE 5 -> 0: RESTORE PASSENGERS =====
execute if score @s bw3_state matches 0..4 at @e[type=marker,tag=barrier_w3_repairing,limit=1] run function zombies:map_elements/barrier_w3/management/restore_passenger
execute if score @s bw3_state matches 0..4 run playsound minecraft:block.wood.place block @a[distance=..10] ~ ~ ~ 1 1.2

# ===== STATE 6 -> 5: RESTORE PARENT =====
execute if score @s bw3_state matches 5 at @e[type=marker,tag=barrier_w3_repairing,limit=1] run data merge entity @e[type=item_display,tag=barrier_w3_parent,distance=..1,limit=1] {view_range:0.5f}
execute if score @s bw3_state matches 5 at @e[type=marker,tag=barrier_w3_repairing,limit=1] run tag @e[type=item_display,tag=barrier_w3_parent,distance=..1] remove barrier_w3_hidden
execute if score @s bw3_state matches 5 run playsound minecraft:block.wood.place block @a[distance=..10] ~ ~ ~ 1 1.4

# ===== UPGRADE LIGHT BLOCKS (STATE 6->5 ONLY) =====
execute if score @s bw3_state matches 5 at @e[type=marker,tag=barrier_w3_repairing,limit=1] run function zombies:map_elements/barrier_w3/management/update_light_blocks

# ===== CLEAN UP TAGS =====
tag @e[type=marker,tag=barrier_w3_repairing] remove barrier_w3_repairing
