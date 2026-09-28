# Snapshot failures remove the new marker so a missing snapshot can never break a wall.
scoreboard players set #de_el_saved temp 0
$execute store success score #de_el_saved temp run clone ~ ~ ~ ~ ~ ~ to zbk:door_storage $(sx) 64 $(sz) replace force
execute if score #de_el_saved temp matches 0 run kill @s
