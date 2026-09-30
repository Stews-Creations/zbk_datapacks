# Copy the active slot's magazine, reserve, and capacity into scratch scores.
# Padding and layout read these; empty/reloading color overrides follow in display.
$execute store result score #hud_ammo temp run scoreboard players get @s $(ammo_objective)
$execute store result score #hud_reserve temp run scoreboard players get @s $(reserve_objective)
$execute store result score #hud_capacity temp run scoreboard players get @s $(max_ammo_objective)

# Low ammo (20% or less of capacity): compare 5 * ammo against capacity on a copy.
scoreboard players set #hud_five temp 5
scoreboard players operation #hud_ammo_low temp = #hud_ammo temp
scoreboard players operation #hud_ammo_low temp *= #hud_five temp
execute if score #hud_capacity temp matches 1.. if score #hud_ammo temp matches 1.. if score #hud_ammo_low temp <= #hud_capacity temp run data modify storage zbk:hud args.ammo_color set value "#E8C65A"
