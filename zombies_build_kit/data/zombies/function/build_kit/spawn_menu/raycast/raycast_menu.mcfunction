# ===================================
# SPAWN MENU - UNIFIED RAYCAST
# ===================================
# Single recursive raycast that checks ALL menu interaction entities
# Stops at the FIRST menu interaction hit — prevents highlighting through options
# Runs from player's eye position

# Early exit if a previous recursion step already found a target
execute if entity @e[type=text_display,tag=being_looked_at] run return fail

# Check each interaction — only tag if nothing was tagged yet (first match wins)
execute unless entity @e[type=text_display,tag=being_looked_at] as @e[type=interaction,tag=menu_interaction_start,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run tag @e[type=text_display,tag=menu_option_start,limit=1,sort=nearest] add being_looked_at
execute unless entity @e[type=text_display,tag=being_looked_at] as @e[type=interaction,tag=menu_interaction_skip_cutscene,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run tag @e[type=text_display,tag=menu_option_skip_cutscene,limit=1,sort=nearest] add being_looked_at
execute unless entity @e[type=text_display,tag=being_looked_at] as @e[type=interaction,tag=menu_interaction_build,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run tag @e[type=text_display,tag=menu_option_build,limit=1,sort=nearest] add being_looked_at
execute unless entity @e[type=text_display,tag=being_looked_at] as @e[type=interaction,tag=menu_interaction_music,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run tag @e[type=text_display,tag=menu_option_music,limit=1,sort=nearest] add being_looked_at

# Stop if ANY menu interaction was hit
execute if entity @e[type=text_display,tag=being_looked_at] run return fail

# Continue raycast forward if not at max distance and block is passable
execute if score #menu_raycast_distance global matches ..100 positioned ^ ^ ^0.1 if block ~ ~ ~ #zombies:raycast_pass run scoreboard players add #menu_raycast_distance global 1
execute if score #menu_raycast_distance global matches ..100 positioned ^ ^ ^0.1 if block ~ ~ ~ #zombies:raycast_pass run function zombies:build_kit/spawn_menu/raycast/raycast_menu
