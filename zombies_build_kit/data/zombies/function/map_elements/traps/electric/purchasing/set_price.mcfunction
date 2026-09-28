# === SET TRAP PRICE ===
# Sets the activation price of the nearest electric trap
# Usage: /trigger set_trap_price set <price>

# Store the price in the nearest trap corner marker's data
execute as @a[scores={set_trap_price=1..}] at @s run execute store result entity @e[type=marker,tag=trap_corner,limit=1,sort=nearest] data.cost int 1 run scoreboard players get @s set_trap_price

# Update nearest trap sign (finds trap_sign marker within 20 blocks)
execute as @a[scores={set_trap_price=1..}] at @s run execute store result storage minecraft:temp cost int 1 run scoreboard players get @s set_trap_price
execute as @a[scores={set_trap_price=1..}] at @s as @e[type=marker,tag=trap_sign,distance=..20,limit=1,sort=nearest] at @s run function zombies:map_elements/traps/electric/purchasing/update_sign_simple with storage minecraft:temp

# Confirmation message
execute as @a[scores={set_trap_price=1..,debug_level=4..},tag=debug] at @s run tellraw @s [{"text":"[TRAP] ","color":"green"},{"text":"Price set to ","color":"gold"},{"score":{"name":"@s","objective":"set_trap_price"},"color":"yellow"},{"text":" for nearest trap.","color":"gold"}]

# Reset trigger
scoreboard players reset @a[scores={set_trap_price=1..}] set_trap_price
scoreboard players enable @a set_trap_price
