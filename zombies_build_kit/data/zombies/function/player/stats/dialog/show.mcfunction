# ===================================
# STATS DIALOG - SHOW
# ===================================
# Stores all players' scores to storage and opens the combat record dialog
# Runs as the player who triggered show_stats

# If no game has been played yet, show a message
execute unless score #stats_player_count stats matches 1.. run dialog show @s {type:"minecraft:notice",title:"Combat Record",body:[{type:"minecraft:plain_message",contents:"No game has been played yet.\nStart a game to begin tracking stats."}],action:{label:"Close"},pause:false}
execute unless score #stats_player_count stats matches 1.. run return 0

# Reset counter
scoreboard players set #stats_dialog_count stats 0

# Initialize dialog storage with defaults so macros never break
data remove storage zombies:stats dialog
data modify storage zombies:stats dialog set value {round:0,p1:"",p2:"",p3:"",p4:"",p1_kills:0,p1_headshots:0,p1_downs:0,p1_revives:0,p1_doors:0,p2_kills:0,p2_headshots:0,p2_downs:0,p2_revives:0,p2_doors:0,p3_kills:0,p3_headshots:0,p3_downs:0,p3_revives:0,p3_doors:0,p4_kills:0,p4_headshots:0,p4_downs:0,p4_revives:0,p4_doors:0}

# Store current round number (live if game active, saved if game over)
execute if score #global game_active matches 1.. store result storage zombies:stats dialog.round int 1 run scoreboard players get #global wave.round
execute unless score #global game_active matches 1.. run data modify storage zombies:stats dialog.round set from storage zombies:stats last_round

# Copy player names from existing capture
data modify storage zombies:stats dialog.p1 set from storage zombies:stats players.p1
data modify storage zombies:stats dialog.p2 set from storage zombies:stats players.p2
data modify storage zombies:stats dialog.p3 set from storage zombies:stats players.p3
data modify storage zombies:stats dialog.p4 set from storage zombies:stats players.p4

# Store each player's scores to storage (all players, not just adventure mode, so dead/spectating players are included)
execute as @a run function zombies:player/stats/dialog/store_player_scores

# Route to correct variant based on player count (from game start capture)
execute if score #stats_player_count stats matches 1 run function zombies:player/stats/dialog/show_1p with storage zombies:stats dialog
execute if score #stats_player_count stats matches 2 run function zombies:player/stats/dialog/show_2p with storage zombies:stats dialog
execute if score #stats_player_count stats matches 3 run function zombies:player/stats/dialog/show_3p with storage zombies:stats dialog
execute if score #stats_player_count stats matches 4.. run function zombies:player/stats/dialog/show_4p with storage zombies:stats dialog
