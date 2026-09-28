data modify storage zbk:hud args.reload_bar set value "\uE12C"
execute unless score @s rb_step matches 0..43 run return 0
execute store result storage zbk:hud reload_index int 1 run scoreboard players get @s rb_step
function zbk:player/actionbar/reload/select with storage zbk:hud
