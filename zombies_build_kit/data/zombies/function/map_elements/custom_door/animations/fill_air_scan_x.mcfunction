# === SELECTIVE FILL AIR - X BLOCK SCANNER ===
# Checks saved block at current position, sets to air if non-air in storage

# Compute storage X for this block
scoreboard players operation #cd_sx global = #cd_loop_x global
scoreboard players operation #cd_sx global += #cd_off_x global
execute store result storage zombies:temp fa.sx int 1 run scoreboard players get #cd_sx global
execute store result storage zombies:temp fa.x int 1 run scoreboard players get #cd_loop_x global

function zombies:map_elements/custom_door/animations/fill_air_check with storage zombies:temp fa

scoreboard players add #cd_loop_x global 1
execute if score #cd_loop_x global <= #cd_max_x global run function zombies:map_elements/custom_door/animations/fill_air_scan_x
