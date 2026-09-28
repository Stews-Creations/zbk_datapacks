# === OPEN PERK MACHINE DIALOG ===
# Shows perk machine marker dialog with delete option

tag @e[tag=open_dialog,limit=1,sort=nearest] remove open_dialog

dialog show @s {type:"minecraft:multi_action",title:"Perk Machine",body:[{type:"minecraft:plain_message",contents:"Marker Type: Perk Machine\n\nThis marker tracks a perk machine location.\nDelete will remove the structure and all associated entities."}],actions:[{label:"Delete Perk Machine",action:{type:"minecraft:run_command",command:"/function zombies:build_kit/management/perk_machine/delete"}}],exit_action:{label:"Close"}}
