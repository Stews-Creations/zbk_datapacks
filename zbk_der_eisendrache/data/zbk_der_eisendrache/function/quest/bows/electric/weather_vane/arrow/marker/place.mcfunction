# Standing position and yaw become the unique broken-arrow pickup placement.
execute unless score #active zbk.de matches 1 run return 0
execute unless dimension minecraft:overworld run return 0
execute unless entity @e[type=marker,tag=de_el_vane_marker,distance=..32] run return run tellraw @s {"text":"[Electric Bow] Stand within 32 blocks of the placed vane.","color":"yellow"}
execute if entity @e[type=marker,tag=de_el_vane_marker,scores={de_el_stage=1..}] run return run tellraw @s {"text":"[Electric Bow] Reset the vane quest before moving its arrow pickup.","color":"yellow"}
kill @e[type=marker,tag=de_el_arrow_marker]
summon marker ~ ~ ~ {Tags:["de_el_arrow_marker","de_bow_pickup"],data:{quest:1,model:"lightning"}}
tp @e[type=marker,tag=de_el_arrow_marker,limit=1] ~ ~ ~ ~ 0
tellraw @s {"text":"[Electric Bow] Broken-arrow pickup position saved.","color":"green"}
