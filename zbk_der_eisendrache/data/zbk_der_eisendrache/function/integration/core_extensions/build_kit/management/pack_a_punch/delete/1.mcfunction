scoreboard players set #de_pack_delete_redirect stats 0
execute if entity @e[type=marker,tag=pack_a_punch,tag=pap_delete_target,tag=de_pack_a_punch_location,limit=1] as @e[type=marker,tag=pack_a_punch,tag=pap_delete_target,tag=de_pack_a_punch_location,limit=1] at @s run function zbk_der_eisendrache:map_pack_a_punch/build/select_delete_target_from_machine
execute if score #de_pack_delete_redirect stats matches 1 run function zbk:global/events/request/complete {result:1}
execute if score #de_pack_delete_redirect stats matches 1 run function zbk_der_eisendrache:map_pack_a_punch/build/delete
execute if score #de_pack_delete_redirect stats matches 2 run function zbk:global/events/request/complete {result:1}
execute if score #de_pack_delete_redirect stats matches 2 run function zbk_der_eisendrache:map_pack_a_punch/build/delete_orphan_machine
execute unless entity @e[type=marker,tag=pack_a_punch,tag=pap_delete_target,limit=1] if entity @e[type=marker,distance=..5,tag=pack_a_punch,tag=de_pack_a_punch_location,limit=1,sort=nearest] as @e[type=marker,distance=..5,tag=pack_a_punch,tag=de_pack_a_punch_location,limit=1,sort=nearest] at @s run function zbk_der_eisendrache:map_pack_a_punch/build/select_delete_target_from_machine
execute if score #de_pack_delete_redirect stats matches 1 run function zbk:global/events/request/complete {result:1}
execute if score #de_pack_delete_redirect stats matches 1 run function zbk_der_eisendrache:map_pack_a_punch/build/delete
execute if score #de_pack_delete_redirect stats matches 2 run function zbk:global/events/request/complete {result:1}
execute if score #de_pack_delete_redirect stats matches 2 run function zbk_der_eisendrache:map_pack_a_punch/build/delete_orphan_machine
