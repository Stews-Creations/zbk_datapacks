# === OPEN MAP PACK-A-PUNCH LOCATION DIALOG ===

tag @e[tag=open_dialog,limit=1,sort=nearest] remove open_dialog

dialog show @s {type:"minecraft:multi_action",title:"Der Eisendrache Pack-a-Punch Location",body:[{type:"minecraft:plain_message",contents:"Marker Type: Der Eisendrache Pack-a-Punch Location\n\nPlayers must link three unique locations. The Pack-a-Punch machine appears at the last linked location, then moves every three rounds in placement order."}],actions:[{label:"Delete Location",action:{type:"minecraft:run_command",command:"/function zbk_der_eisendrache:map_pack_a_punch/build/delete"}}],exit_action:{label:"Close"}}
