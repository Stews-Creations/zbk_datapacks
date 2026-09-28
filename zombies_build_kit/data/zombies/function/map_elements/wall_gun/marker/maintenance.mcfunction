# Saved-marker reconciliation is independent of purchase responsiveness.
# Read each loaded marker afresh; a chunk loaded later is picked up by the next maintenance pass.

# Called as each loaded wall marker by the shared 20-tick (1-second) hook.
# Read the ID once instead of searching all markers separately for each retired ID.
scoreboard players set #wall_maintenance_id temp 0
execute store result score #wall_maintenance_id temp run data get entity @s data.gun_id
execute if score #wall_maintenance_id temp matches 1..6 run return run function zombies:combat/weapons/guns/bo3/migration/loaded_wall
execute if score #wall_maintenance_id temp matches 8..10 run return run function zombies:combat/weapons/guns/bo3/migration/loaded_wall
execute unless data entity @s data.pap_ammo_price run function zombies:map_elements/wall_gun/marker/upgrade_prices
