# === OPEN PERK MACHINE DIALOG ===
# Shows perk machine marker dialog with delete option

scoreboard players reset @s pm_v2_select
execute as @e[type=marker,tag=perk_machine,tag=open_dialog,limit=1,sort=nearest] unless score @s pm_v2_id matches 1.. run function zbk:map_elements/perks/machines/lifecycle/allocate
scoreboard players operation @s pm_v2_select = @e[type=marker,tag=perk_machine,tag=open_dialog,limit=1,sort=nearest] pm_v2_id
tag @e[type=marker,tag=perk_machine,tag=open_dialog,limit=1,sort=nearest] remove open_dialog

dialog show @s {type:"minecraft:multi_action",title:"Perk Machine",body:[{type:"minecraft:plain_message",contents:"Marker Type: Perk Machine\n\nThis marker tracks a perk machine location.\nDelete will remove this machine, its collision blocks, and its owned displays."}],actions:[{label:"Delete Perk Machine",action:{type:"minecraft:run_command",command:"/function zbk:map_elements/perks/build_kit/machines/markers/delete"}}],exit_action:{label:"Close"}}
