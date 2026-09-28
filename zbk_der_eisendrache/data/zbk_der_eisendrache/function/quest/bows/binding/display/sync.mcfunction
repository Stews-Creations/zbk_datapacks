# Run as the persistent pickup marker; readiness and ownership also work while other chunks are unloaded.
scoreboard players set @s de_bow_visual 0
$execute if score #$(quest) de_bow_ready matches 1 unless score #$(quest) de_bow_owner matches 1.. run scoreboard players set @s de_bow_visual 1
$execute unless score #$(quest) de_bow_ready matches 1 run return run kill @e[tag=de_bow_$(quest)_runtime]
$execute if score #$(quest) de_bow_owner matches 1.. run return run kill @e[tag=de_bow_$(quest)_runtime]
$execute if entity @e[type=interaction,tag=de_bow_$(quest)_runtime] run return 0
function zbk_der_eisendrache:quest/bows/binding/display/spawn with entity @s data
