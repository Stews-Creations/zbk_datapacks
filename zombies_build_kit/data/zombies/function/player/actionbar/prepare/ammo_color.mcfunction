# Compare magazine fraction using integer scores; empty/reloading overrides follow.
$execute store result score #hud_ammo temp run scoreboard players get @s $(ammo_objective)
$execute store result score #hud_capacity temp run scoreboard players get @s $(max_ammo_objective)
scoreboard players set #hud_five temp 5
scoreboard players operation #hud_ammo temp *= #hud_five temp
execute if score #hud_capacity temp matches 1.. if score #hud_ammo temp matches 1.. if score #hud_ammo temp <= #hud_capacity temp run data modify storage zombies:hud args.ammo_color set value "#E8C65A"
