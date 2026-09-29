# === OPEN WORLDSPAWN DIALOG ===
# Shows worldspawn marker dialog with delete option

tag @e[tag=open_dialog,limit=1,sort=nearest] remove open_dialog

dialog show @s {type:"minecraft:multi_action",title:"Worldspawn Marker",body:[{type:"minecraft:plain_message",contents:"Marker Type: Worldspawn\n\nPlayers respawn here on game over.\nOnly one worldspawn marker can exist at a time.\nPlacing a new one removes the old one."}],actions:[{label:"Delete Marker",action:{type:"minecraft:run_command",command:"/function zbk:game/lobby/build_kit/markers/delete_marker"}},{label:"Back",action:{type:"minecraft:show_dialog",dialog:"zbk:build_kit"}}],exit_action:{label:"Close"}}
