function zbk:combat/weapons/events/interaction_hit
execute if data storage zbk:events result{blocked:1b} run return 0
# Returns 1 only when an interaction consumes the shot. Caller remains the shooter.
function zbk:combat/weapons/events/extension/mechanics/raycast/interactions/before_core_interactions
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
execute if score #is_explosive stats matches 1 if entity @e[type=interaction,tag=disco_interaction,distance=..1] run return 1


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
