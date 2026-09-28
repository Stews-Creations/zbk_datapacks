# Internal entry implementation. Movement effects are added in a later stage.
tag @s add de_ag_inside
tag @s remove de_ag_suppressed
execute if entity @s[tag=de_ag_debug] run tellraw @s [{"text":"[Anti-Gravity Bounds] ","color":"light_purple"},{"text":"Entered room.","color":"green"}]
