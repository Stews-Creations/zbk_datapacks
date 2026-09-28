# ===================================
# GAME MODE DETECTION
# ===================================
# Purpose: Detect if the game is solo or co-op based on player count
# Called from: game/management/start.mcfunction
#
# Scoreboard Values:
# #game_mode game_mode = 1 (solo) or 2 (co-op)
# #player_count game_mode = number of active players
# ===================================

# Count active players in adventure mode (in-game players)
scoreboard players set #player_count game_mode 0
execute as @a[gamemode=adventure] run scoreboard players add #player_count game_mode 1

# Set game mode based on player count
# Solo = 1 player
execute if score #player_count game_mode matches ..1 run scoreboard players set #game_mode game_mode 1

# Co-op = 2+ players
execute if score #player_count game_mode matches 2.. run scoreboard players set #game_mode game_mode 2

# Announce game mode
execute if score #game_mode game_mode matches 1 as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Game] ","color":"gold"},{"text":"Mode: Solo","color":"aqua"}]
execute if score #game_mode game_mode matches 2 as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Game] ","color":"gold"},{"text":"Mode: Co-op (","color":"aqua"},{"score":{"name":"#player_count","objective":"game_mode"},"color":"yellow"},{"text":" players)","color":"aqua"}]
