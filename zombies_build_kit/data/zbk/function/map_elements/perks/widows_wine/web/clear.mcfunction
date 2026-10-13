attribute @s minecraft:movement_speed modifier remove zbk:widows_web
execute on passengers if entity @s[tag=ww_web_visual] run kill @s
tag @s remove ww_webbed
scoreboard players reset @s ww_timer
scoreboard players reset @s ww_strength
