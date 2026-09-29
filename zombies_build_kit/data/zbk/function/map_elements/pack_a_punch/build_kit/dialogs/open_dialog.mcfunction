# === OPEN PACK-A-PUNCH DIALOG ===
# Shows pack-a-punch marker dialog with delete option

tag @e[tag=open_dialog,limit=1,sort=nearest] remove open_dialog

dialog show @s {type:"minecraft:multi_action",title:"Pack-a-Punch",body:[{type:"minecraft:plain_message",contents:"Marker Type: Pack-a-Punch\n\nThis marker tracks a Pack-a-Punch location.\nDelete will replace the structure with the empty version and remove all associated displays."}],actions:[{label:"Delete Pack-a-Punch",action:{type:"minecraft:run_command",command:"/function zbk:map_elements/pack_a_punch/build_kit/markers/delete"}}],exit_action:{label:"Close"}}
