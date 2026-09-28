# Called once after wave.round increments.

execute unless score #map_pap_unlocked map_pap matches 1.. run return 0
execute unless score #map_pap_move_rounds map_pap matches 1.. run scoreboard players set #map_pap_move_rounds map_pap 3

scoreboard players add @e[type=marker,tag=map_pack_a_punch_active] map_pap_rounds 1

execute as @e[type=marker,tag=map_pack_a_punch_active,tag=!map_pap_move_pending] if score @s map_pap_rounds >= #map_pap_move_rounds map_pap run tellraw @a[tag=debug] [{"text":"[Map Pack-a-Punch] ","color":"light_purple"},{"text":"The machine is shifting locations...","color":"gold"}]
execute as @e[type=marker,tag=map_pack_a_punch_active,tag=!map_pap_move_pending] if score @s map_pap_rounds >= #map_pap_move_rounds map_pap run tag @s add map_pap_move_pending
