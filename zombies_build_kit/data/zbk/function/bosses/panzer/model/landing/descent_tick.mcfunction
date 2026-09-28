# Controlled Panzer landing descent.
# Runs as and at: panzer_ai iron golem tagged panzer_landing_descent.

data modify entity @s fall_distance set value 0f
execute unless block ~ ~-0.12 ~ #zbk:raycast_pass run data modify entity @s NoGravity set value 0b
execute unless block ~ ~-0.12 ~ #zbk:raycast_pass run data modify entity @s NoAI set value 0b
execute unless block ~ ~-0.12 ~ #zbk:raycast_pass run tag @s remove panzer_landing_descent
execute if entity @s[tag=panzer_landing_descent] run tp @s ~ ~-0.1 ~
