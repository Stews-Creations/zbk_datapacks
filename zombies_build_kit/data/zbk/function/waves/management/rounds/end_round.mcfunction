# === END ROUND ===
# Purpose: Handle round completion - announce, reset state
# Called when all enemies are eliminated

execute as @a[tag=debug,scores={debug_level=3..}] run tellraw @s [{"text":"[WAVE] ","color":"aqua"},{"text":"Round ","color":"green"},{"score":{"name":"#global","objective":"wave.round"},"color":"yellow"},{"text":" complete!","color":"green"}]

execute unless score #global wave.is_active matches 1.. run return 0
function zbk:waves/events/round_end

# Set state to inactive
scoreboard players set #global wave.is_active 0

# Play round change sound to all players (skip for dog rounds - they have their own end sound)
execute if score #global wave.is_dog_round matches 0 run function zbk:waves/audio/round_end

# Remove pumpkin fog effect from all players after dog round
execute if score #global wave.is_dog_round matches 1 run item replace entity @a armor.head with air
# Clear any pumpkins players may have stashed in their inventory during the dog round
execute if score #global wave.is_dog_round matches 1 run clear @a minecraft:carved_pumpkin[custom_model_data~{flags:[true]}]

# Clear dog round flag
scoreboard players set #global wave.is_dog_round 0

# Respawn dead players at spawn point
function zbk:game/spawn_points/players/respawn_dead_players

# Auto-cycle to next round if game is still active
# Schedule next round start after 5-second delay (100 ticks)
execute if score #global game_active matches 1 run schedule function zbk:waves/management/rounds/start_round 100t
