data modify storage zombies:hud args.reload_bar set value "\uE12C"
execute unless score @s rb_step matches 0..43 run return 0
execute store result storage zombies:hud reload_index int 1 run scoreboard players get @s rb_step
function zombies:player/actionbar/reload/select with storage zombies:hud
