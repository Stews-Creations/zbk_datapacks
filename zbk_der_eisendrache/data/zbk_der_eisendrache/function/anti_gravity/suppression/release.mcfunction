# Restore movement eligibility when a player backs out before launching.
execute unless entity @s[tag=de_ag_inside,tag=de_ag_suppressed] run return 0

tag @s remove de_ag_suppressed
execute if entity @s[tag=de_ag_debug] run tellraw @s [{"text":"[Anti-Gravity Bounds] ","color":"light_purple"},{"text":"Movement restored after leaving 115 launch zone.","color":"green"}]
