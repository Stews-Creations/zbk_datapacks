# === DELETE FULL DOOR (KEEP BLOCKS & DISPLAYS) ===
# Removes all markers, signs, interactions, text displays, highlight cubes, and float centers
# Leaves world blocks and block_display entities intact

# Get the door ID from the nearest custom_door marker
execute at @s run scoreboard players operation #cd_delete_id custom_door_id = @e[type=marker,tag=custom_door,distance=..5,limit=1,sort=nearest] custom_door_id

# Validate ID is not 0 (unlinked)
execute if score #cd_delete_id custom_door_id matches 0 run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Cannot delete door: marker has no Link ID (0). Assign an ID first or use single Delete.","color":"red"}]
execute if score #cd_delete_id custom_door_id matches 0 run return 0

# Tag corner markers with matching door ID
execute as @e[tag=custom_door] if score @s custom_door_id = #cd_delete_id custom_door_id run tag @s add cd_delete

# Tag sign markers with matching door ID, and kill their nearby UI/interaction (which have no score)
execute as @e[tag=custom_door_sign] if score @s custom_door_id = #cd_delete_id custom_door_id at @s run kill @e[type=text_display,tag=custom_door_sign_ui,distance=..5]
execute as @e[tag=custom_door_sign] if score @s custom_door_id = #cd_delete_id custom_door_id at @s run kill @e[type=interaction,tag=custom_door_sign_interaction,distance=..5]
execute as @e[tag=custom_door_sign] if score @s custom_door_id = #cd_delete_id custom_door_id run tag @s add cd_delete

# TP highlight cubes to void first (prevents splitting/loot), then kill
execute as @e[type=magma_cube,tag=cd_highlight_cube] if score @s custom_door_id = #cd_delete_id custom_door_id run tp @s ~ -10000 ~
execute as @e[type=magma_cube,tag=cd_highlight_cube] if score @s custom_door_id = #cd_delete_id custom_door_id run kill @s

# Tag float centers with matching door ID
execute as @e[tag=cd_float_center] if score @s custom_door_id = #cd_delete_id custom_door_id run tag @s add cd_delete

# Kill all tagged entities
kill @e[tag=cd_delete]

tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Door deleted (blocks & displays kept). ID: ","color":"green"},{"score":{"name":"#cd_delete_id","objective":"custom_door_id"},"color":"yellow"}]
