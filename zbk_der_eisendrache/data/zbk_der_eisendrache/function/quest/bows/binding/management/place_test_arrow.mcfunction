# Operator fixture only: create another available arrow without implementing its Easter egg.
execute unless score #active zbk.de matches 1 run return 0
execute unless dimension minecraft:overworld run return 0
$scoreboard players set #de_bow_test temp $(quest)
execute unless score #de_bow_test temp matches 2..4 run return 0
$execute if score #$(quest) de_bow_owner matches 1.. run return run tellraw @s {"text":"Unbind this quest before moving its test arrow.","color":"yellow"}
# Refuse replacement rather than duplicating an unloaded persistent placement.
$execute if score #$(quest) de_bow_ready matches 1 run return run tellraw @s {"text":"This test arrow is already placed. Load it and remove test arrows before replacing it.","color":"yellow"}
$summon marker ~ ~ ~ {Tags:["de_bow_pickup","de_bow_test","de_bow_new"],data:{quest:$(quest)}}
tp @e[type=marker,tag=de_bow_new,limit=1] ~ ~ ~ ~ 0
execute if score #de_bow_test temp matches 2 run data modify entity @e[type=marker,tag=de_bow_new,limit=1] data.model set value "fire"
execute if score #de_bow_test temp matches 3 run data modify entity @e[type=marker,tag=de_bow_new,limit=1] data.model set value "wolf"
execute if score #de_bow_test temp matches 4 run data modify entity @e[type=marker,tag=de_bow_new,limit=1] data.model set value "void"
$scoreboard players set #$(quest) de_bow_ready 1
execute as @e[type=marker,tag=de_bow_new] at @s rotated as @s run function zbk_der_eisendrache:quest/bows/binding/display/sync with entity @s data
tag @e[tag=de_bow_new] remove de_bow_new
