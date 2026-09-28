# Start through the persistent Spawn Menu V2 cutscene setting when that menu exists.
execute unless score #global game_active matches 0 run return fail
execute if score #global cutscene_active matches 1.. run return fail

# Keep legacy /trigger start_game behavior when no v2 menu is placed.
execute unless entity @e[type=marker,tag=spawn_menu_v2_marker,limit=1] run return run function zbk:map_elements/cutscenes/start_game/intercept

# The v2 marker owns the cutscene setting. Missing or unexpected values default to enabled.
execute if score @e[type=marker,tag=spawn_menu_v2_marker,limit=1] spawn_menu_v2_cutscene matches 0 run return run function zbk:game/management/start
function zbk:map_elements/cutscenes/start_game/intercept
