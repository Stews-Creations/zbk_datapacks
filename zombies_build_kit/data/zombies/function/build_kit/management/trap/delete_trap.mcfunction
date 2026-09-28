# === DELETE NEAREST ELECTRIC TRAP ===
# Removes nearest trap markers (corners, sign, control) and sign block.
# Uses distance-based selection like other build kit dialogs.

# Remove sign block
execute as @e[type=marker,tag=trap_sign,distance=..20,limit=1,sort=nearest] at @s run setblock ~ ~ ~ air

# Kill all nearby trap markers
kill @e[type=marker,tag=trap_sign,distance=..20,limit=1,sort=nearest]
kill @e[type=marker,tag=trap_corner,distance=..20,limit=2,sort=nearest]
kill @e[type=marker,tag=trap_control,distance=..20,limit=1,sort=nearest]

# Feedback
tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Electric trap deleted.","color":"red"}]
