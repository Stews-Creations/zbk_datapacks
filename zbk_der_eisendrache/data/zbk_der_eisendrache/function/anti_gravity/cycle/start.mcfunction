# Completing all four plates permanently unlocks cycling until reset.
execute unless score #active zbk.de matches 1 run return 0
execute if score #unlocked de_ag_cycle matches 1 run return 0

scoreboard players set #unlocked de_ag_cycle 1
tellraw @a[tag=debug] [{"text":"[Anti-Gravity] ","color":"light_purple"},{"text":"All four plates activated. Room cycling unlocked.","color":"aqua"}]
execute as @a at @s run playsound minecraft:block.beacon.power_select player @s ~ ~ ~ 0.9 1.25
function zbk_der_eisendrache:anti_gravity/cycle/start_on
