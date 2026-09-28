# Link by persistent candidate ID, never by nearest entity.
scoreboard players operation #rs_owner rs_candidate = @s rs_candidate
scoreboard players set #rs_found temp 0
$execute as @e[type=interaction,tag=rs_$(part)_runtime,distance=..1] if score @s rs_candidate = #rs_owner rs_candidate run scoreboard players set #rs_found temp 1
$execute if score #rs_found temp matches 0 run function zbk:map_elements/rocket_shield/spawning/runtime {part:"$(part)"}
