# Called as/at one debris item_display when its link animation finishes.

particle minecraft:flash{color:[0.6,0.8,1.0,1.0]} ~ ~ ~ 0 0 0 0 1 force
particle minecraft:dust{color:[0.25,0.7,1.0],scale:1.2} ~ ~ ~ 0.35 0.35 0.35 0 14 force
execute as @s on passengers run kill @s
kill @e[type=item_display,distance=..0.05,tag=de_pack_debris,scores={map_pap_uses=5..}]
kill @s
