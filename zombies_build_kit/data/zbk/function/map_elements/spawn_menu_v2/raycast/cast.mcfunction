# Recursive 0.1-block raycast from the nearest player's eyes.

execute if entity @e[type=text_display,tag=spawn_menu_v2_runtime,tag=being_looked_at] run return fail

execute as @e[type=interaction,tag=spawn_menu_v2_interaction_start,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run tag @e[type=text_display,tag=spawn_menu_v2_option_start,limit=1,sort=nearest] add being_looked_at
execute unless entity @e[type=text_display,tag=spawn_menu_v2_runtime,tag=being_looked_at] as @e[type=interaction,tag=spawn_menu_v2_interaction_cutscene,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run tag @e[type=text_display,tag=spawn_menu_v2_option_cutscene,limit=1,sort=nearest] add being_looked_at
execute unless entity @e[type=text_display,tag=spawn_menu_v2_runtime,tag=being_looked_at] as @e[type=interaction,tag=spawn_menu_v2_interaction_music,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run tag @e[type=text_display,tag=spawn_menu_v2_option_music,limit=1,sort=nearest] add being_looked_at
execute unless entity @e[type=text_display,tag=spawn_menu_v2_runtime,tag=being_looked_at] as @e[type=interaction,tag=spawn_menu_v2_interaction_help,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run tag @e[type=text_display,tag=spawn_menu_v2_option_help,limit=1,sort=nearest] add being_looked_at

execute if entity @e[type=text_display,tag=spawn_menu_v2_runtime,tag=being_looked_at] run return fail

execute if score #spawn_menu_v2_raycast_distance global matches ..100 positioned ^ ^ ^0.1 if block ~ ~ ~ #zbk:raycast_pass run scoreboard players add #spawn_menu_v2_raycast_distance global 1
execute if score #spawn_menu_v2_raycast_distance global matches ..100 positioned ^ ^ ^0.1 if block ~ ~ ~ #zbk:raycast_pass run function zbk:map_elements/spawn_menu_v2/raycast/cast
