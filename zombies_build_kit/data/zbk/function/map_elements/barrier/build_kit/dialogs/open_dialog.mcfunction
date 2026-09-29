# === OPEN BARRIER DIALOG ===
# Shows barrier marker dialog

tag @e[tag=open_dialog,limit=1,sort=nearest] remove open_dialog

dialog show @s {type:"minecraft:multi_action",title:"Barrier Marker",body:[{type:"minecraft:plain_message",contents:"Marker Type: Barrier\n\nThis marker defines a barrier location where boards spawn.\nZombies will attack boards to break through.\nPlayers can repair boards for points."}],actions:[{label:"Delete Marker",action:{type:"minecraft:run_command",command:"/function zbk:map_elements/barrier/build_kit/markers/delete_marker"}},{label:"Delete All",action:{type:"minecraft:run_command",command:"/function zbk:map_elements/barrier/build_kit/markers/delete_all"}},{label:"Back to Barriers",action:{type:"minecraft:show_dialog",dialog:"zbk:build_kit/map_elements/barriers/barriers"}}],exit_action:{label:"Close"}}
