# === SHOW ZONE PARTICLES ===
# Macro function - receives zone number (-1 to 32)
# Enables/disables continuous particle display for specified zone
# Zone -1 = off (no particles)

# Store the zone value
$scoreboard players set #highlight_zone global $(zone)

# If zone is -1, turn off particles (set to -1 to disable tick check)
execute if score #highlight_zone global matches -1 as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Zone highlight disabled","color":"gray"}]
execute if score #highlight_zone global matches -1 run return 0

# Feedback message - particles will now display every tick
execute if score #highlight_zone global matches 0 as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Showing particles for Zone 0 (Always Available)","color":"green"}]
execute if score #highlight_zone global matches 1.. as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Showing particles for Zone ","color":"green"},{"score":{"name":"#highlight_zone","objective":"global"},"color":"yellow","bold":true}]
