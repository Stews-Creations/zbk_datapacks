# === HIGHLIGHT SCAN - Z ROW ITERATOR ===
# Iterates Z from #cd_loop_z to #cd_max_z, scanning each X row

scoreboard players operation #cd_loop_x global = #cd_min_x global

# Compute storage Z for this row
scoreboard players operation #cd_sz global = #cd_loop_z global
scoreboard players operation #cd_sz global += #cd_off_z global
execute store result storage zombies:temp hl.sz int 1 run scoreboard players get #cd_sz global
execute store result storage zombies:temp hl.z int 1 run scoreboard players get #cd_loop_z global

function zombies:build_kit/management/custom_door/highlight/scan_x

scoreboard players add #cd_loop_z global 1
execute if score #cd_loop_z global <= #cd_max_z global run function zombies:build_kit/management/custom_door/highlight/scan_z
