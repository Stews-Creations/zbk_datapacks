# Remove moved/cursor copies before reclaiming the canonical melee slot.
clear @s *[custom_data~{knife:true}]
execute if items entity @s hotbar.3 *[custom_data~{gun:true}] run item replace entity @s hotbar.3 with minecraft:air
execute store result score #equipment_reserved temp run function zbk:player/inventory/equipment/reserve {slot:"hotbar.3"}
execute unless score #equipment_reserved temp matches 1 run return 0
# Wrapper to store player_id and give knife atomically per player
# This prevents shared storage conflicts when multiple players need knives simultaneously

# Store this player's ID to temp storage
execute store result storage zbk:temp player_id int 1 run scoreboard players get @s id
# Store current knife damage to temp storage
execute store result storage zbk:temp knife_damage int 1 run scoreboard players get #global knife.damage


# Give knife with the stored player_id and knife_damage (happens immediately for this player)
function zbk:player/inventory/melee/give_knife with storage zbk:temp
