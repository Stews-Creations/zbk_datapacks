# === OPEN POWER MARKER DIALOG ===
# Shows power marker dialog with delete option

tag @e[tag=open_dialog,limit=1,sort=nearest] remove open_dialog

dialog show @s {type:"minecraft:multi_action",title:"Power Switch",body:[{type:"minecraft:plain_message",contents:"Marker Type: Power Switch\n\nThis marker defines where the power switch structure is placed.\nDelete will remove the marker and place the power_delete structure."}],actions:[{label:"Delete Power Switch",action:{type:"minecraft:run_command",command:"/function zombies:build_kit/management/power/delete"}},{label:"Back to Map Elements",action:{type:"minecraft:show_dialog",dialog:"zombies:map_elements"}}],exit_action:{label:"Close"}}
