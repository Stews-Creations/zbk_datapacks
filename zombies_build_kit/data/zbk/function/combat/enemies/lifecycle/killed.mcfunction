execute if entity @s[tag=zbk.kill_reported] run return 0
tag @s add zbk.kill_reported
function zbk:combat/enemies/events/enemy_killed
