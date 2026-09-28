# === DELETE BARRIER ENTITIES ===
# Called as/at the barrier marker. Places barrier_empty template to clear
# blocks, then kills all associated entities and the barrier marker.

# Place barrier_empty template with same directional offsets as spawn
execute if score @s playerYaw matches -45..45 run place template minecraft:zombies/barrier_empty ~-1 ~ ~1 counterclockwise_90
execute if score @s playerYaw matches 45..135 run place template minecraft:zombies/barrier_empty ~-1 ~ ~-1 none
execute if score @s playerYaw matches 135..180 run place template minecraft:zombies/barrier_empty ~1 ~ ~-1 clockwise_90
execute if score @s playerYaw matches -180..-135 run place template minecraft:zombies/barrier_empty ~1 ~ ~-1 clockwise_90
execute if score @s playerYaw matches -135..-45 run place template minecraft:zombies/barrier_empty ~1 ~ ~1 180

# Kill board passengers (child item_displays)
kill @e[type=item_display,tag=barrier_passenger,distance=..5]

# Kill board parents (parent item_displays)
kill @e[type=item_display,tag=barrier_boards,distance=..5]

# Kill repair text displays
kill @e[type=text_display,tag=barrier_repair_text,distance=..5]

# Kill boards_spawn marker (from structure template)
kill @e[type=marker,tag=boards_spawn,distance=..3]

# Kill nearby player_block marker
kill @e[type=marker,tag=player_block,distance=..5]

# Kill nearby zombie_block marker
kill @e[type=marker,tag=barrier_zombie_block,distance=..5]

# Kill self (barrier marker)
kill @s
