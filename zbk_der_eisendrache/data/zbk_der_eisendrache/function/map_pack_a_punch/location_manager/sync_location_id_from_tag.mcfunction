# Called as a map_pack_a_punch_location marker. DE placement tags are authoritative.

execute if entity @s[tag=de_pap_location_1] run scoreboard players set @s map_pap_location_id 1
execute if entity @s[tag=de_pap_location_2] run scoreboard players set @s map_pap_location_id 2
execute if entity @s[tag=de_pap_location_3] run scoreboard players set @s map_pap_location_id 3
