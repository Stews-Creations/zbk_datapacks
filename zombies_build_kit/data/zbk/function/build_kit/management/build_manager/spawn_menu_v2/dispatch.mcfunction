# Dispatch the selected v2 spawn-menu marker to its management dialog.

tag @e[tag=build_manager_target,limit=1,sort=nearest] add open_dialog
tag @e[tag=build_manager_target] remove build_manager_target
function zbk:build_kit/management/spawn_menu_v2/open_dialog
