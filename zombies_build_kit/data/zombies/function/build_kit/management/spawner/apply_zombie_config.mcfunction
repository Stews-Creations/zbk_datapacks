# === APPLY ZOMBIE SPAWNER CONFIG ===
# Macro function - receives zone and mode.
# Modes:
# 0 = standard
# 1-4 = hole east/south/west/north
# 5-8 = wall east/south/west/north

$scoreboard players set #selected_zone global $(zone)
$scoreboard players set #selected_mode global $(mode)

# Clamp mode to the known values.
execute if score #selected_mode global matches ..0 run scoreboard players set #selected_mode global 0
execute if score #selected_mode global matches 9.. run scoreboard players set #selected_mode global 8

# Apply to the nearest zombie spawner.
execute as @p at @s if entity @e[type=marker,tag=zombie_spawner,distance=..5,limit=1] store result entity @e[type=marker,tag=zombie_spawner,distance=..5,limit=1,sort=nearest] data.zone int 1 run scoreboard players get #selected_zone global
execute as @p at @s if entity @e[type=marker,tag=zombie_spawner,distance=..5,limit=1] store result entity @e[type=marker,tag=zombie_spawner,distance=..5,limit=1,sort=nearest] data.mode int 1 run scoreboard players get #selected_mode global

# Reconfiguration allows a corrected entrance to retry immediately.
execute as @p at @s run scoreboard players reset @e[type=marker,tag=zombie_spawner,distance=..5,limit=1,sort=nearest] wz_blocked
execute as @p at @s run scoreboard players reset @e[type=marker,tag=zombie_spawner,distance=..5,limit=1,sort=nearest] wz_failures
execute as @p at @s run tag @e[type=marker,tag=zombie_spawner,distance=..5,limit=1,sort=nearest] remove wz_invalid_reported

# Feedback to player.
execute if score #selected_zone global matches 0 as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Zombie spawner set to Always Active (Zone 0)","color":"green"}]
execute if score #selected_zone global matches 1.. as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Zombie spawner set to Zone ","color":"green"},{"score":{"name":"#selected_zone","objective":"global"},"color":"yellow","bold":true}]
execute if score #selected_mode global matches 0 as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Zombie spawner mode set to Standard.","color":"green"}]
execute if score #selected_mode global matches 1 as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Zombie spawner mode set to Hole East.","color":"green"}]
execute if score #selected_mode global matches 2 as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Zombie spawner mode set to Hole South.","color":"green"}]
execute if score #selected_mode global matches 3 as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Zombie spawner mode set to Hole West.","color":"green"}]
execute if score #selected_mode global matches 4 as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Zombie spawner mode set to Hole North.","color":"green"}]
execute if score #selected_mode global matches 5 as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Zombie spawner mode set to Wall East.","color":"green"}]
execute if score #selected_mode global matches 6 as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Zombie spawner mode set to Wall South.","color":"green"}]
execute if score #selected_mode global matches 7 as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Zombie spawner mode set to Wall West.","color":"green"}]
execute if score #selected_mode global matches 8 as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Zombie spawner mode set to Wall North.","color":"green"}]

# Reopen the dialog to keep it open.
function zombies:build_kit/management/spawner/dialogs/open_zone_dialog_refresh {spawner_type:"Zombie",spawner_tag:"zombie_spawner"}
