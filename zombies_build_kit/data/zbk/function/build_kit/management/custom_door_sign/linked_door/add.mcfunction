# === ADD LINKED DOOR (GROUP MERGE) ===
# Macro function - receives door_id to link
# Merges this door's group with the target door's group so all members know each other

$scoreboard players set #linked_door_id global $(door_id)

# Get the link ID of the nearest sign (the current door)
execute as @p at @s store result score #cd_sign_link global run scoreboard players get @e[type=marker,tag=custom_door_sign,distance=..5,limit=1,sort=nearest] custom_door_id

# Don't allow linking to self
execute if score #linked_door_id global = #cd_sign_link global run tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"Cannot link a door to itself!","color":"red"}]
execute if score #linked_door_id global = #cd_sign_link global run return 0

# Tag target signs to verify they exist
tag @e[type=marker,tag=custom_door_sign] remove cd_link_target
execute as @e[type=marker,tag=custom_door_sign] if score @s custom_door_id = #linked_door_id global run tag @s add cd_link_target
execute unless entity @e[type=marker,tag=cd_link_target] run tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"No door found with that Link ID!","color":"red"}]
execute unless entity @e[type=marker,tag=cd_link_target] run return 0

# === Step 1: Tag all signs that belong to the merged group ===
tag @e[type=marker,tag=custom_door_sign] remove cd_in_group
tag @e[type=marker,tag=custom_door_sign] remove cd_group_rep

# Tag current door's signs
execute as @e[type=marker,tag=custom_door_sign] if score @s custom_door_id = #cd_sign_link global run tag @s add cd_in_group

# Tag target door's signs
execute as @e[type=marker,tag=cd_link_target] run tag @s add cd_in_group

# Tag all doors already linked to current door
execute as @p at @s if data entity @e[type=marker,tag=custom_door_sign,distance=..5,limit=1,sort=nearest] data.linked_doors run data modify storage zbk:temp ld_to_tag set from entity @e[type=marker,tag=custom_door_sign,distance=..5,limit=1,sort=nearest] data.linked_doors
execute as @p at @s if data entity @e[type=marker,tag=custom_door_sign,distance=..5,limit=1,sort=nearest] data.linked_doors run function zbk:build_kit/management/custom_door_sign/linked_door/tag_linked_recursive

# Tag all doors already linked to target door
execute if data entity @e[type=marker,tag=cd_link_target,limit=1] data.linked_doors run data modify storage zbk:temp ld_to_tag set from entity @e[type=marker,tag=cd_link_target,limit=1] data.linked_doors
execute if data entity @e[type=marker,tag=cd_link_target,limit=1] data.linked_doors run function zbk:build_kit/management/custom_door_sign/linked_door/tag_linked_recursive

# === Step 2: Mark one representative per unique door ID ===
execute as @e[type=marker,tag=custom_door_sign,tag=cd_in_group] run function zbk:build_kit/management/custom_door_sign/linked_door/mark_representative

# === Step 3: Rebuild linked_doors for every sign in the group ===
execute as @e[type=marker,tag=custom_door_sign,tag=cd_in_group] run function zbk:build_kit/management/custom_door_sign/linked_door/rebuild_linked_doors

# === Cleanup ===
tag @e[tag=cd_in_group] remove cd_in_group
tag @e[tag=cd_group_rep] remove cd_group_rep
tag @e[tag=cd_link_target] remove cd_link_target

# Feedback
$tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"Linked door ","color":"green"},{"text":"$(door_id)","color":"yellow","bold":true},{"text":" - groups merged","color":"green"}]

# Refresh dialog
function zbk:build_kit/management/custom_door_sign/dialogs/open_config_dialog_refresh
