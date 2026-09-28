# === REMOVE LINKED DOOR (GROUP-AWARE) ===
# Macro function - receives door_id to unlink
# Removes the target door from the entire group and removes all group IDs from the target

$scoreboard players set #linked_door_id global $(door_id)

# Get the link ID of the nearest sign (the current door)
execute as @p at @s store result score #cd_sign_link global run scoreboard players get @e[type=marker,tag=custom_door_sign,distance=..5,limit=1,sort=nearest] custom_door_id

# Remove the target door's ID from ALL signs that have it in their linked_doors
scoreboard players operation #ld_to_remove global = #linked_door_id global
execute as @e[type=marker,tag=custom_door_sign] if data entity @s data.linked_doors run function zombies:build_kit/management/custom_door_sign/linked_door/remove_from_sign

# Clear the target door's linked_doors entirely (it's leaving the group)
execute as @e[type=marker,tag=custom_door_sign] if score @s custom_door_id = #linked_door_id global run data modify entity @s data.linked_doors set value []

# Feedback
$tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"Removed door ","color":"green"},{"text":"$(door_id)","color":"yellow","bold":true},{"text":" from the group","color":"green"}]

# Refresh dialog
function zombies:build_kit/management/custom_door_sign/dialogs/open_config_dialog_refresh
