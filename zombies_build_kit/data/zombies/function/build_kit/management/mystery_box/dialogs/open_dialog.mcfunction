# === OPEN MYSTERY BOX DIALOG ===
# Shows mystery box location marker dialog with spawn location status

# Check spawn location status and show appropriate dialog
execute if score @e[tag=open_dialog,limit=1] mystery_box_spawn_location matches 1 run function zombies:build_kit/management/mystery_box/dialogs/show_dialog_spawn
execute unless score @e[tag=open_dialog,limit=1] mystery_box_spawn_location matches 1 run function zombies:build_kit/management/mystery_box/dialogs/show_dialog_no_spawn

# Remove the tag
tag @e[tag=open_dialog,limit=1,sort=nearest] remove open_dialog
