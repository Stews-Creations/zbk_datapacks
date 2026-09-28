# Context: one active location marker. Preserve priority 3 over 2 over 1 regardless of selector iteration order.

execute if entity @s[tag=de_pap_location_1] if score #de_pap_sign_location global matches 0 run scoreboard players set #de_pap_sign_location global 1
execute if entity @s[tag=de_pap_location_2] if score #de_pap_sign_location global matches ..1 run scoreboard players set #de_pap_sign_location global 2
execute if entity @s[tag=de_pap_location_3] run scoreboard players set #de_pap_sign_location global 3
