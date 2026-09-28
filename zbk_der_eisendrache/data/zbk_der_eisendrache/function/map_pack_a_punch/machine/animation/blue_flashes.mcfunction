# Brighter blue flashes while the DE machine is upgrading.
# Called as/at the active Der Eisendrache Pack-a-Punch marker.

scoreboard players add #de_pack_a_punch_flash_tick pack_a_punch 1
execute if score #de_pack_a_punch_flash_tick pack_a_punch matches 6.. run scoreboard players set #de_pack_a_punch_flash_tick pack_a_punch 0
execute unless score #de_pack_a_punch_flash_tick pack_a_punch matches 0 run return 0

execute as @e[type=item_display,distance=..3,tag=de_pack_a_punch_rotaters,limit=1,sort=nearest] at @s rotated as @s run particle minecraft:dust{color:[0.0,0.35,1.0],scale:1.15} ^0 ^0.05 ^ 0.95 0.3 0.24 0 10 force
execute as @e[type=item_display,distance=..3,tag=de_pack_a_punch_rotaters,limit=1,sort=nearest] at @s rotated as @s run particle minecraft:dust{color:[0.0,0.7,1.0],scale:0.7} ^1.05 ^0.05 ^ 0.22 0.24 0.16 0 4 force
execute as @e[type=item_display,distance=..3,tag=de_pack_a_punch_rotaters,limit=1,sort=nearest] at @s rotated as @s run particle minecraft:dust{color:[0.0,0.7,1.0],scale:0.7} ^0 ^0.05 ^ 0.22 0.24 0.16 0 4 force
execute as @e[type=item_display,distance=..3,tag=de_pack_a_punch_rotaters,limit=1,sort=nearest] at @s rotated as @s run particle minecraft:dust{color:[0.0,0.7,1.0],scale:0.7} ^-1.05 ^0.05 ^ 0.22 0.24 0.16 0 4 force
