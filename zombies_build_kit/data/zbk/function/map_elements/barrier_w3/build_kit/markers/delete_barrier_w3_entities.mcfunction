# === DELETE BARRIER W3 ENTITIES ===
# Called as/at the barrier_w3 marker. Places barrier_width3_empty template to clear
# blocks, then kills all associated entities and the barrier marker.

# Place barrier_width3_empty template with same directional offsets as spawn
execute if score @s playerYaw matches -45..45 run place template zbk:barriers/barrier_width3_empty ~-1 ~ ~1 counterclockwise_90
execute if score @s playerYaw matches 45..135 run place template zbk:barriers/barrier_width3_empty ~-1 ~ ~-1 none
execute if score @s playerYaw matches 135..180 run place template zbk:barriers/barrier_width3_empty ~1 ~ ~-1 clockwise_90
execute if score @s playerYaw matches -180..-135 run place template zbk:barriers/barrier_width3_empty ~1 ~ ~-1 clockwise_90
execute if score @s playerYaw matches -135..-45 run place template zbk:barriers/barrier_width3_empty ~1 ~ ~1 180

# Kill board passengers (child item_displays)
kill @e[type=item_display,tag=barrier_w3_passenger,distance=..5]

# Kill board parents (parent item_displays)
kill @e[type=item_display,tag=barrier_w3_boards,distance=..5]

# Kill repair text displays
kill @e[type=text_display,tag=barrier_w3_repair_text,distance=..5]

# Kill boards_spawn_w3 marker (from structure template)
kill @e[type=marker,tag=boards_spawn_w3,distance=..5]

# Kill nearby player_block marker
kill @e[type=marker,tag=player_block,distance=..5]

# Kill nearby zombie_block marker
kill @e[type=marker,tag=barrier_zombie_block,distance=..5]

# Kill self (barrier_w3 marker)
kill @s
