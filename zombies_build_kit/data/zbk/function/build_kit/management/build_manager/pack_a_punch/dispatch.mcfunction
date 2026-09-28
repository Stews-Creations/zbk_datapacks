# Dispatch: Pack-a-Punch
# Preserve the selected machine across dialog interaction; fall back to nearest in delete.
tag @e[type=marker,tag=pack_a_punch,tag=pap_delete_target] remove pap_delete_target
tag @e[tag=build_manager_target,limit=1,sort=nearest] add open_dialog
tag @e[tag=build_manager_target,limit=1,sort=nearest] add pap_delete_target
function zbk:build_kit/management/build_manager/cleanup
function zbk:build_kit/management/pack_a_punch/open_dialog
