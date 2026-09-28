# === APPLY SPAWNER ZONE TO NEAREST TYPE ===
# Macro function - receives zone number, spawner type, and spawner tag
# Applies the zone only to the nearest spawner of that marker type

# Store the zone value in scoreboard
$scoreboard players set #selected_zone global $(zone)

# Apply to nearest spawner of the dialog's marker type.
$execute as @p at @s if entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1] store result entity @e[type=marker,tag=$(spawner_tag),distance=..5,limit=1,sort=nearest] data.zone int 1 run scoreboard players get #selected_zone global

# Feedback to player
execute if score #selected_zone global matches 0 as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Spawner set to Always Active (Zone 0)","color":"green"}]
execute if score #selected_zone global matches 1.. as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Spawner set to Zone ","color":"green"},{"score":{"name":"#selected_zone","objective":"global"},"color":"yellow","bold":true}]

# Reopen the dialog to keep it open
$function zombies:build_kit/management/spawner/dialogs/open_zone_dialog_refresh {spawner_type:"$(spawner_type)",spawner_tag:"$(spawner_tag)"}
