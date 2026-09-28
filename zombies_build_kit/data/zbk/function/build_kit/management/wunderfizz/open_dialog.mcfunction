# === OPEN WUNDERFIZZ DIALOG ===
# Shows wunderfizz marker dialog with delete option

tag @e[tag=open_dialog,limit=1,sort=nearest] remove open_dialog

dialog show @s {type:"minecraft:multi_action",title:"Der Wunderfizz",body:[{type:"minecraft:plain_message",contents:"Marker Type: Der Wunderfizz\n\nRandom perk machine location.\nDelete will remove the structure and all associated entities."}],actions:[{label:"Delete Wunderfizz",action:{type:"minecraft:run_command",command:"/function zbk:build_kit/management/wunderfizz/delete"}}],exit_action:{label:"Close"}}
