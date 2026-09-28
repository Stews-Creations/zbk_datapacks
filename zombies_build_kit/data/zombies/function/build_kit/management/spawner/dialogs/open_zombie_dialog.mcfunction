# === OPEN ZOMBIE SPAWNER DIALOG ===
# Opens the zombie-only spawner dialog with zone, mode, and immunity settings.

# Get current zone and mode from the tagged spawner.
scoreboard players set #current_zone global 0
scoreboard players set #current_mode global 0
execute unless data entity @e[tag=open_dialog,tag=zombie_spawner,limit=1,sort=nearest] data.mode run data modify entity @e[tag=open_dialog,tag=zombie_spawner,limit=1,sort=nearest] data.mode set value 0
execute store result score #current_zone global run data get entity @e[tag=open_dialog,tag=zombie_spawner,limit=1,sort=nearest] data.zone
execute store result score #current_mode global run data get entity @e[tag=open_dialog,tag=zombie_spawner,limit=1,sort=nearest] data.mode

# Keep saved mode values in the known range.
execute if score #current_mode global matches ..0 run scoreboard players set #current_mode global 0
execute if score #current_mode global matches 9.. run scoreboard players set #current_mode global 8
execute store result entity @e[tag=open_dialog,tag=zombie_spawner,limit=1,sort=nearest] data.mode int 1 run scoreboard players get #current_mode global

# Store data for macro function.
data modify storage zombies:temp zombie_spawner_dialog set value {current_zone:0,current_mode:0,mode_label:"Standard"}
execute store result storage zombies:temp zombie_spawner_dialog.current_zone int 1 run scoreboard players get #current_zone global
execute store result storage zombies:temp zombie_spawner_dialog.current_mode int 1 run scoreboard players get #current_mode global
execute if score #current_mode global matches 1 run data modify storage zombies:temp zombie_spawner_dialog.mode_label set value "Hole East"
execute if score #current_mode global matches 2 run data modify storage zombies:temp zombie_spawner_dialog.mode_label set value "Hole South"
execute if score #current_mode global matches 3 run data modify storage zombies:temp zombie_spawner_dialog.mode_label set value "Hole West"
execute if score #current_mode global matches 4 run data modify storage zombies:temp zombie_spawner_dialog.mode_label set value "Hole North"
execute if score #current_mode global matches 5 run data modify storage zombies:temp zombie_spawner_dialog.mode_label set value "Wall East"
execute if score #current_mode global matches 6 run data modify storage zombies:temp zombie_spawner_dialog.mode_label set value "Wall South"
execute if score #current_mode global matches 7 run data modify storage zombies:temp zombie_spawner_dialog.mode_label set value "Wall West"
execute if score #current_mode global matches 8 run data modify storage zombies:temp zombie_spawner_dialog.mode_label set value "Wall North"
tag @e[tag=open_dialog,tag=zombie_spawner,limit=1,sort=nearest] remove open_dialog

# Call macro function with storage data.
function zombies:build_kit/management/spawner/dialogs/show_zombie_dialog with storage zombies:temp zombie_spawner_dialog
