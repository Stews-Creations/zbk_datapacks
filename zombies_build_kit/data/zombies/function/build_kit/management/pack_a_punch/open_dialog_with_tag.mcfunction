# Tag the nearest pack_a_punch marker for the open_dialog routing, then show the dialog.
# Called from map_elements/pack_a_punch/buy/interact.mcfunction when the player is holding
# the build_manager stick at click time.
#
# Preserve the selected machine across dialog interaction; fall back to nearest in delete.
tag @e[type=marker,tag=pack_a_punch,tag=pap_delete_target] remove pap_delete_target
tag @e[type=marker,distance=..5,tag=pack_a_punch,limit=1,sort=nearest] add open_dialog
tag @e[type=marker,distance=..5,tag=pack_a_punch,limit=1,sort=nearest] add pap_delete_target
function zombies:build_kit/management/pack_a_punch/open_dialog
