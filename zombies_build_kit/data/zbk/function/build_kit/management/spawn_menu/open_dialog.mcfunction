# === OPEN SPAWN MENU DIALOG ===
# Shows spawn menu marker dialog with delete option

tag @e[tag=open_dialog,limit=1,sort=nearest] remove open_dialog

dialog show @s {type:"minecraft:multi_action",title:"Spawn Menu",body:[{type:"minecraft:plain_message",contents:"Marker Type: Spawn Menu\n\nInteractive menu with Start Game, Build Kit, and Menu Music options.\n\nDeleting removes all text displays and interactions."}],actions:[{label:"Delete Spawn Menu",action:{type:"minecraft:run_command",command:"/function zbk:build_kit/management/spawn_menu/delete_marker"}},{label:"Back to Map Elements",action:{type:"minecraft:show_dialog",dialog:"zbk:map_elements"}}],exit_action:{label:"Close"}}
