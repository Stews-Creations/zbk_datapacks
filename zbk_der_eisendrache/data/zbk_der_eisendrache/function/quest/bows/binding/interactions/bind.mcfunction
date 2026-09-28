execute unless score #active zbk.de matches 1 run return 0
execute unless dimension minecraft:overworld run return 0
$scoreboard players set #de_bow_target temp $(quest)
execute unless score #de_bow_target temp matches 1..4 run return 0
execute if entity @s[team=downed] run return 0
execute unless score @s id matches 1.. run return 0
$execute unless score #$(quest) de_bow_ready matches 1 run return 0
$execute unless entity @e[type=interaction,tag=de_bow_$(quest)_runtime,distance=..0.1] run return 0
# Validate destination BEFORE releasing anything. An occupied quest can never be stolen.
$execute if score #$(quest) de_bow_owner matches 1.. run return 0
function zbk_der_eisendrache:quest/bows/binding/management/unbind
$scoreboard players operation #$(quest) de_bow_owner = @s id
$scoreboard players set #$(quest) de_bow_started 1
$kill @e[tag=de_bow_$(quest)_runtime]
# Record first electric binding without resetting later feature progress on subsequent bindings.
execute if score #de_bow_target temp matches 1 if entity @e[type=marker,tag=de_el_vane_marker,scores={de_el_stage=2}] run scoreboard players set @e[type=marker,tag=de_el_vane_marker] de_el_stage 3
execute if score #de_bow_target temp matches 1 at @s run playsound zbk_der_eisendrache:der_eisendrache.quest.bows.electric.arrow_pickup master @s ~ ~ ~ 1 1
execute as @e[type=marker,tag=de_bow_pickup] at @s rotated as @s run function zbk_der_eisendrache:quest/bows/binding/display/sync with entity @s data
execute unless score #de_bow_target temp matches 1 at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.3
tellraw @s[tag=debug] {"text":"Upgrade quest bound. Saved quest progress retained.","color":"aqua"}
return 1
