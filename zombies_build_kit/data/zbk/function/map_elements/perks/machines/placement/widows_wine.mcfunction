# Called as the placement bat, at the centered floor block.
execute unless block ~ ~ ~ #zbk:perk_machine_clear run return run function zbk:map_elements/perks/machines/placement/blocked
execute unless block ~ ~1 ~ #zbk:perk_machine_clear run return run function zbk:map_elements/perks/machines/placement/blocked
summon marker ~ ~ ~ {Tags:["perk_machine","perk_widows_wine","pm_v2","pm_v2_new"]}
execute as @e[type=marker,tag=pm_v2_new,limit=1] at @s run function zbk:map_elements/perks/machines/placement/configure
tag @e[type=marker,tag=pm_v2_new] remove pm_v2_new
kill @s
