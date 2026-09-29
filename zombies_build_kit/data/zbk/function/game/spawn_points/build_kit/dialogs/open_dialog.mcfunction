# === OPEN SPAWN POINT DIALOG ===
# Shows spawn point marker dialog

tag @e[tag=open_dialog,limit=1,sort=nearest] remove open_dialog

dialog show @s {type:"minecraft:multi_action",title:"Spawn Point Marker",body:[{type:"minecraft:plain_message",contents:"Marker Type: Spawn Point\n\nPlayer spawn location when game starts or after respawning.\nMultiple spawn points can be placed. Players are distributed\nevenly across all spawn points in round-robin order."}],actions:[{label:"Delete Marker",action:{type:"minecraft:run_command",command:"/function zbk:game/spawn_points/build_kit/markers/delete_marker"}},{label:"Back to Map Elements",action:{type:"minecraft:show_dialog",dialog:"zbk:build_kit/map_elements"}}],exit_action:{label:"Close"}}
