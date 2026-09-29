# Dispatch the selected v2 spawn-menu marker to its management dialog.

tag @e[tag=build_manager_target,limit=1,sort=nearest] add open_dialog
tag @e[tag=build_manager_target] remove build_manager_target
function zbk:map_elements/spawn_menu_v2/build_kit/dialogs/open_dialog
