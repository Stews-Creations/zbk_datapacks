# Subtle idle blue particles around the DE rotaters.

execute unless entity @e[type=item_display,tag=de_pack_a_punch_rotaters,limit=1] run return 0

scoreboard players add #de_pack_a_punch_glow_tick pack_a_punch 1
execute if score #de_pack_a_punch_glow_tick pack_a_punch matches 8.. run scoreboard players set #de_pack_a_punch_glow_tick pack_a_punch 0
execute unless score #de_pack_a_punch_glow_tick pack_a_punch matches 0 run return 0

execute as @e[type=item_display,tag=de_pack_a_punch_rotaters] at @s rotated as @s run particle minecraft:dust{color:[0.0,0.25,1.0],scale:0.45} ^1.05 ^0.05 ^ 0.18 0.18 0.12 0 1 normal
execute as @e[type=item_display,tag=de_pack_a_punch_rotaters] at @s rotated as @s run particle minecraft:dust{color:[0.0,0.25,1.0],scale:0.45} ^0 ^0.05 ^ 0.18 0.18 0.12 0 1 normal
execute as @e[type=item_display,tag=de_pack_a_punch_rotaters] at @s rotated as @s run particle minecraft:dust{color:[0.0,0.25,1.0],scale:0.45} ^-1.05 ^0.05 ^ 0.18 0.18 0.12 0 1 normal
