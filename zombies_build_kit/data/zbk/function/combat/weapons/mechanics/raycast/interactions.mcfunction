function zbk:dispatch/interaction_hit
execute if data storage zbk:events result{blocked:1b} run return 0
# Returns 1 only when an interaction consumes the shot. Caller remains the shooter.
function zbk:dispatch/extension/combat/weapons/mechanics/raycast/interactions/1
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

function zbk:dispatch/extension/combat/weapons/mechanics/raycast/interactions/2
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

# Check for disco interaction hit (explosive weapons only, stops raycast)
function zbk:dispatch/extension/combat/weapons/mechanics/raycast/interactions/3
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
execute if score #is_explosive stats matches 1 if entity @e[type=interaction,tag=disco_interaction,distance=..1] run return 1

# Check for menu interaction hit (lobby only, does not stop raycast, only triggers once per bullet)
execute if score #global game_active matches 0 as @e[type=interaction,tag=menu_interaction_start,tag=!menu_raycast_hit,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function zbk:build_kit/spawn_menu/handlers/on_start_game_click
execute if score #global game_active matches 0 as @e[type=interaction,tag=menu_interaction_skip_cutscene,tag=!menu_raycast_hit,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function zbk:build_kit/spawn_menu/handlers/on_skip_cutscene_click
execute if score #global game_active matches 0 as @e[type=interaction,tag=menu_interaction_build,tag=!menu_raycast_hit,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function zbk:build_kit/spawn_menu/handlers/on_build_kit_click
execute if score #global game_active matches 0 as @e[type=interaction,tag=menu_interaction_music,tag=!menu_raycast_hit,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function zbk:build_kit/spawn_menu/handlers/on_menu_music_click
execute if score #global game_active matches 0 as @e[type=interaction,tag=menu_interaction_start,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run tag @s add menu_raycast_hit
execute if score #global game_active matches 0 as @e[type=interaction,tag=menu_interaction_skip_cutscene,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run tag @s add menu_raycast_hit
execute if score #global game_active matches 0 as @e[type=interaction,tag=menu_interaction_build,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run tag @s add menu_raycast_hit
execute if score #global game_active matches 0 as @e[type=interaction,tag=menu_interaction_music,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run tag @s add menu_raycast_hit

# Check for Spawn Menu V2 interaction hits (lobby only).
execute if score #global game_active matches 0 as @e[type=interaction,tag=spawn_menu_v2_interaction_start,tag=!menu_v2_raycast_hit,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function zbk:map_elements/spawn_menu_v2/interactions/on_start_shot
execute if score #global game_active matches 0 as @e[type=interaction,tag=spawn_menu_v2_interaction_cutscene,tag=!menu_v2_raycast_hit,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function zbk:map_elements/spawn_menu_v2/interactions/on_cutscene_shot
execute if score #global game_active matches 0 as @e[type=interaction,tag=spawn_menu_v2_interaction_music,tag=!menu_v2_raycast_hit,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function zbk:map_elements/spawn_menu_v2/interactions/on_music_shot
execute if score #global game_active matches 0 as @e[type=interaction,tag=spawn_menu_v2_interaction_help,tag=!menu_v2_raycast_hit,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function zbk:map_elements/spawn_menu_v2/interactions/on_help_shot
execute if score #global game_active matches 0 as @e[type=interaction,tag=spawn_menu_v2_interaction,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run tag @s add menu_v2_raycast_hit

# Radio hit - non-explosive weapons trigger start radio
execute unless score #is_explosive stats matches 1 as @e[type=interaction,tag=radio_interaction,tag=!raycast_hit,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function zbk:map_elements/radio/gameplay/hit_bullet
execute unless score #is_explosive stats matches 1 as @e[type=interaction,tag=radio_interaction,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run tag @s add raycast_hit

# Dr Monty Radio hit - any weapon triggers hit function
execute as @e[type=interaction,tag=dr_monty_radio_interaction,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run tag @s add raycast_hit

# Explosive barrel hit - non-explosive weapons reduce barrel health
execute unless score #is_explosive stats matches 1 as @e[type=interaction,tag=explosive_barrel_interaction,tag=!raycast_hit,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function zbk:map_elements/explosive_barrel/gameplay/hit_bullet
execute unless score #is_explosive stats matches 1 as @e[type=interaction,tag=explosive_barrel_interaction,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run tag @s add raycast_hit

# Explosive barrel hit - explosive weapons instantly detonate barrel
execute if score #is_explosive stats matches 1 as @e[type=interaction,tag=explosive_barrel_interaction,tag=!raycast_hit,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function zbk:map_elements/explosive_barrel/gameplay/hit_explosive
execute if score #is_explosive stats matches 1 as @e[type=interaction,tag=explosive_barrel_interaction,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run tag @s add raycast_hit

return 0
