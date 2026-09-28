# === HIGHLIGHT SCAN - X BLOCK SCANNER ===
# Checks saved block at current position, summons magma cube if non-air

# Compute storage X for this block
scoreboard players operation #cd_sx global = #cd_loop_x global
scoreboard players operation #cd_sx global += #cd_off_x global
execute store result storage zbk:temp hl.sx int 1 run scoreboard players get #cd_sx global
execute store result storage zbk:temp hl.x int 1 run scoreboard players get #cd_loop_x global

function zbk:build_kit/management/custom_door/highlight/check with storage zbk:temp hl

scoreboard players add #cd_loop_x global 1
execute if score #cd_loop_x global <= #cd_max_x global run function zbk:build_kit/management/custom_door/highlight/scan_x
