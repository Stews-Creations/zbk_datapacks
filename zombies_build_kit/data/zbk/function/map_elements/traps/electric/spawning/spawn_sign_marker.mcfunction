# === SPAWN TRAP SIGN MARKER ===
# Runs as the detected glow item frame for trap sign marker.

# Frame facing south -> wall sign faces south
execute if data entity @s {Facing:3b} run setblock ~ ~ ~ minecraft:oak_wall_sign[facing=south]{is_waxed:1b}
# Frame facing west -> wall sign faces west
execute if data entity @s {Facing:4b} run setblock ~ ~ ~ minecraft:oak_wall_sign[facing=west]{is_waxed:1b}
# Frame facing north -> wall sign faces north
execute if data entity @s {Facing:2b} run setblock ~ ~ ~ minecraft:oak_wall_sign[facing=north]{is_waxed:1b}
# Frame facing east -> wall sign faces east
execute if data entity @s {Facing:5b} run setblock ~ ~ ~ minecraft:oak_wall_sign[facing=east]{is_waxed:1b}

summon marker ~ ~ ~ {Tags:["trap_sign"],data:{cost:1000,duration:30,cooldown:45}}
data merge block ~ ~ ~ {front_text:{messages:[{"text":"[Electric Trap]","color":"aqua","bold":true},{"text":"Cost: 1000","color":"yellow"},{ "text":"Activate","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function zbk:map_elements/traps/electric/purchasing/buy"}},""]}}
particle minecraft:end_rod ~ ~0.5 ~ 0.1 0.5 0.1 0.01 10 force
execute as @a[distance=..10,tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[TRAP] ","color":"green"},{"text":"Trap sign placed!","color":"gold"}]
function zbk:build_kit/util/placement/cleanup
