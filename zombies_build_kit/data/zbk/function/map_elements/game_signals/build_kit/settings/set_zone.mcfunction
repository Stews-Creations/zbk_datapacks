# Set the zone number for the nearest zone_unlocked signal marker
# Macro function - receives {zone: <number>}
$data modify entity @e[type=marker,tag=game_signal,tag=signal_zone_unlocked,distance=..5,limit=1,sort=nearest] data.zone set value $(zone)
$tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Signal zone set to ","color":"white"},{"text":"$(zone)","color":"aqua","bold":true},{"text":".","color":"white"}]
