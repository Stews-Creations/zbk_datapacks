# Called as/at a linking map Pack-a-Punch location while its debris animates.

execute as @e[type=item_display,distance=..12,tag=de_pack_debris,scores={map_pap_uses=0..},sort=nearest,limit=7] at @s run function zbk_der_eisendrache:map_pack_a_punch/unlock/debris_float_tick
execute unless entity @e[type=item_display,distance=..12,tag=de_pack_debris,scores={map_pap_uses=0..},limit=1] if entity @s[tag=map_pap_complete_after_debris] run function zbk_der_eisendrache:map_pack_a_punch/unlock/complete
execute unless entity @e[type=item_display,distance=..12,tag=de_pack_debris,scores={map_pap_uses=0..},limit=1] run tag @s remove map_pap_complete_after_debris
execute unless entity @e[type=item_display,distance=..12,tag=de_pack_debris,scores={map_pap_uses=0..},limit=1] run tag @s remove map_pap_debris_anim
