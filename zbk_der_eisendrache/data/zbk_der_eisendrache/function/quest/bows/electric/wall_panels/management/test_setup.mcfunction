# Temporary operator shortcut for the executing player's wall-panel testing; never called by gameplay.
execute unless entity @s[type=minecraft:player,scores={id=1..}] run return 0
execute unless score #active zbk.de matches 1 run return run tellraw @s {"text":"Select Der Eisendrache before starting the panel test.","color":"yellow"}
execute at @s unless dimension minecraft:overworld run return 0

execute at @s run function zbk_der_eisendrache:anti_gravity/management/enter
execute at @s run function zbk_der_eisendrache:anti_gravity/management/activate
execute at @s run function zbk_der_eisendrache:quest/bows/binding/management/unbind
scoreboard players operation #1 de_bow_owner = @s id
scoreboard players set #electric de_el_progress 1
function zbk_der_eisendrache:quest/bows/electric/wall_panels/initialize
tellraw @s {"text":"Panel test ready: anti-gravity active, electric quest bound, three-fire stage complete. Move along the wall-run path to test the panels.","color":"aqua"}
