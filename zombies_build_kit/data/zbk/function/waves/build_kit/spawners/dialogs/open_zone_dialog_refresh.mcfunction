# === REFRESH SPAWNER ZONE DIALOG ===
# Re-opens the spawner zone dialog with updated values
# This is called after applying changes to keep the dialog open

# Tag the nearest spawner marker for the current dialog type.
$execute at @s run tag @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1,sort=nearest] add open_dialog

# Re-open the same spawner type.
$execute if entity @e[tag=open_dialog,tag=$(spawner_tag),tag=zombie_spawner,limit=1] run function zbk:waves/build_kit/spawners/dialogs/open_zombie_dialog
$execute unless entity @e[tag=open_dialog,tag=zombie_spawner,limit=1] if entity @e[tag=open_dialog,tag=$(spawner_tag),limit=1] run function zbk:waves/build_kit/spawners/dialogs/open_zone_dialog {spawner_type:"$(spawner_type)",spawner_tag:"$(spawner_tag)"}
