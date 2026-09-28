# === SET DOOR PRICE ===
# Sets the price of the nearest door marker based on trigger value
# Usage: /trigger set_door_price set <price>

# Store the price in the nearest door marker's data.name
execute as @a[scores={set_door_price=1..}] at @s run execute store result entity @e[type=marker,tag=door,limit=1,sort=nearest] data.name int 1 run scoreboard players get @s set_door_price

# Respawn the text display and interaction entity with new price
execute as @a[scores={set_door_price=1..}] at @s as @e[type=marker,tag=door,limit=1,sort=nearest] at @s run kill @e[type=text_display,tag=door_ui,distance=..5]
execute as @a[scores={set_door_price=1..}] at @s as @e[type=marker,tag=door,limit=1,sort=nearest] at @s run kill @e[type=interaction,tag=door_interaction,distance=..5]
execute as @a[scores={set_door_price=1..}] at @s as @e[type=marker,tag=door,limit=1,sort=nearest] at @s run function zbk:map_elements/door/purchasable/update_display

# Confirmation message (debug only)
execute as @a[scores={set_door_price=1..,debug_level=4..},tag=debug] at @s run tellraw @s [{"text":"[DOOR] ","color":"green"},{"text":"Price set to ","color":"gold"},{"score":{"name":"@s","objective":"set_door_price"},"color":"yellow"},{"text":" for nearest door.","color":"gold"}]

# Reset trigger
scoreboard players reset @a[scores={set_door_price=1..}] set_door_price
scoreboard players enable @a set_door_price
