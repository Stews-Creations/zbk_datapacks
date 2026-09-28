# Build Manager dialog for a placed DE Pack-a-Punch location sign.

dialog show @s {type:"minecraft:multi_action",title:"DE Pack-a-Punch Sign",body:[{type:"minecraft:plain_message",contents:"Marker Type: Der Eisendrache Pack-a-Punch Sign\n\nShows which of the three Pack-a-Punch locations is active. Empty means the machine has not spawned yet."}],actions:[{label:"Delete Sign",action:{type:"minecraft:run_command",command:"/function zbk_der_eisendrache:map_pack_a_punch/sign/delete"}}],exit_action:{label:"Close"}}

tag @e[type=marker,tag=de_pack_location_sign,tag=open_dialog] remove open_dialog
tag @e[type=marker,tag=de_pack_location_sign,tag=build_manager_target] remove build_manager_target
