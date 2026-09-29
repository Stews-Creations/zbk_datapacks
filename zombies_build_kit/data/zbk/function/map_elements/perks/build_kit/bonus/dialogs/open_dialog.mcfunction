# === OPEN PERK BONUS DIALOG ===
# Shows perk bonus marker dialog

tag @e[tag=open_dialog,limit=1,sort=nearest] remove open_dialog

dialog show @s {type:"minecraft:multi_action",title:"Perk Bonus Marker",body:[{type:"minecraft:plain_message",contents:"Marker Type: Perk Bonus\n\nPerk bonus spawn location.\nGrants players a free perk when claimed."}],actions:[{label:"Delete Marker",action:{type:"minecraft:run_command",command:"/function zbk:map_elements/perks/build_kit/bonus/markers/delete_marker"}},{label:"Delete Perk Machine",action:{type:"minecraft:run_command",command:"/function zbk:map_elements/perks/build_kit/machines/markers/delete"}},{label:"Back to Perks",action:{type:"minecraft:show_dialog",dialog:"zbk:build_kit/map_elements/perks/perks"}}],exit_action:{label:"Close"}}
