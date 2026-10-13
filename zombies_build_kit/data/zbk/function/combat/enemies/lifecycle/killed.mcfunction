execute if entity @s[tag=zbk.kill_reported] run return 0
tag @s add zbk.kill_reported
execute if entity @s[tag=ww_webbed] at @s run function zbk:map_elements/perks/widows_wine/drops/try
function zbk:combat/enemies/events/enemy_killed
