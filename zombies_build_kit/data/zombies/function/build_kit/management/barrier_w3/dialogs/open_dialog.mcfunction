# === OPEN BARRIER W3 DIALOG ===
# Shows wide barrier marker dialog

tag @e[tag=open_dialog,limit=1,sort=nearest] remove open_dialog

dialog show @s {type:"minecraft:multi_action",title:"Barrier Marker (3-Wide)",body:[{type:"minecraft:plain_message",contents:"Marker Type: Barrier (3-Wide)\n\nA 3-block wide barrier. Same functionality as the standard barrier but wider.\nZombies will attack boards to break through.\nPlayers can repair boards for points."}],actions:[{label:"Delete Marker",action:{type:"minecraft:run_command",command:"/function zombies:build_kit/management/barrier_w3/delete_marker"}},{label:"Delete All",action:{type:"minecraft:run_command",command:"/function zombies:build_kit/management/barrier_w3/delete_all"}},{label:"Back to Barriers",action:{type:"minecraft:show_dialog",dialog:"zombies:barriers"}}],exit_action:{label:"Close"}}
