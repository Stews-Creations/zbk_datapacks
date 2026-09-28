# === OPEN SPAWNER IMMUNITY DIALOG ===
# Macro function - receives spawner_type and spawner_tag.

$data modify storage zbk:temp spawner_immunity_dialog set value {spawner_type:"$(spawner_type)",spawner_tag:"$(spawner_tag)",guns_label:"Can be hit",explosives_label:"Can be hit",elements_label:"Can be hit",nuke_label:"Can be hit",melee_label:"Can be hit"}
$execute as @p at @s if entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1,sort=nearest,nbt={data:{immune_guns:1b}}] run data modify storage zbk:temp spawner_immunity_dialog.guns_label set value "Immune"
$execute as @p at @s if entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1,sort=nearest,nbt={data:{immune_explosives:1b}}] run data modify storage zbk:temp spawner_immunity_dialog.explosives_label set value "Immune"
$execute as @p at @s if entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1,sort=nearest,nbt={data:{immune_elements:1b}}] run data modify storage zbk:temp spawner_immunity_dialog.elements_label set value "Immune"
$execute as @p at @s if entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1,sort=nearest,nbt={data:{immune_nuke:1b}}] run data modify storage zbk:temp spawner_immunity_dialog.nuke_label set value "Immune"
$execute as @p at @s if entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1,sort=nearest,nbt={data:{immune_melee:1b}}] run data modify storage zbk:temp spawner_immunity_dialog.melee_label set value "Immune"

function zbk:build_kit/management/spawner/dialogs/show_immunity_dialog with storage zbk:temp spawner_immunity_dialog
