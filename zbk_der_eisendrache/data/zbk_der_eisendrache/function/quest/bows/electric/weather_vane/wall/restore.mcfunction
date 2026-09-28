# Runs at the authored marker. Clear broken state only after a successful exact restore.
scoreboard players set #de_el_restored temp 0
$execute store success score #de_el_restored temp run clone from zombies:door_storage $(sx) 64 $(sz) $(sx) 64 $(sz) ~ ~ ~ replace force
execute if score #de_el_restored temp matches 1 run scoreboard players set @s de_el_broken 0
