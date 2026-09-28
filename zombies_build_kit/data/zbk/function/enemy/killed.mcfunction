execute if entity @s[tag=zbk.kill_reported] run return 0
tag @s add zbk.kill_reported
function zbk:dispatch/enemy_killed
