# ===================================
# STATS DIALOG - STORE PLAYER SCORES
# ===================================
# Runs as each adventure mode player
# Stores their scores to the correct slot in zombies:stats dialog

scoreboard players add #stats_dialog_count stats 1

# Player 1
execute if score #stats_dialog_count stats matches 1 store result storage zombies:stats dialog.p1_kills int 1 run scoreboard players get @s stat_kills
execute if score #stats_dialog_count stats matches 1 store result storage zombies:stats dialog.p1_headshots int 1 run scoreboard players get @s stat_headshots
execute if score #stats_dialog_count stats matches 1 store result storage zombies:stats dialog.p1_downs int 1 run scoreboard players get @s stat_downs
execute if score #stats_dialog_count stats matches 1 store result storage zombies:stats dialog.p1_revives int 1 run scoreboard players get @s stat_revives
execute if score #stats_dialog_count stats matches 1 store result storage zombies:stats dialog.p1_doors int 1 run scoreboard players get @s stat_doors

# Player 2
execute if score #stats_dialog_count stats matches 2 store result storage zombies:stats dialog.p2_kills int 1 run scoreboard players get @s stat_kills
execute if score #stats_dialog_count stats matches 2 store result storage zombies:stats dialog.p2_headshots int 1 run scoreboard players get @s stat_headshots
execute if score #stats_dialog_count stats matches 2 store result storage zombies:stats dialog.p2_downs int 1 run scoreboard players get @s stat_downs
execute if score #stats_dialog_count stats matches 2 store result storage zombies:stats dialog.p2_revives int 1 run scoreboard players get @s stat_revives
execute if score #stats_dialog_count stats matches 2 store result storage zombies:stats dialog.p2_doors int 1 run scoreboard players get @s stat_doors

# Player 3
execute if score #stats_dialog_count stats matches 3 store result storage zombies:stats dialog.p3_kills int 1 run scoreboard players get @s stat_kills
execute if score #stats_dialog_count stats matches 3 store result storage zombies:stats dialog.p3_headshots int 1 run scoreboard players get @s stat_headshots
execute if score #stats_dialog_count stats matches 3 store result storage zombies:stats dialog.p3_downs int 1 run scoreboard players get @s stat_downs
execute if score #stats_dialog_count stats matches 3 store result storage zombies:stats dialog.p3_revives int 1 run scoreboard players get @s stat_revives
execute if score #stats_dialog_count stats matches 3 store result storage zombies:stats dialog.p3_doors int 1 run scoreboard players get @s stat_doors

# Player 4
execute if score #stats_dialog_count stats matches 4 store result storage zombies:stats dialog.p4_kills int 1 run scoreboard players get @s stat_kills
execute if score #stats_dialog_count stats matches 4 store result storage zombies:stats dialog.p4_headshots int 1 run scoreboard players get @s stat_headshots
execute if score #stats_dialog_count stats matches 4 store result storage zombies:stats dialog.p4_downs int 1 run scoreboard players get @s stat_downs
execute if score #stats_dialog_count stats matches 4 store result storage zombies:stats dialog.p4_revives int 1 run scoreboard players get @s stat_revives
execute if score #stats_dialog_count stats matches 4 store result storage zombies:stats dialog.p4_doors int 1 run scoreboard players get @s stat_doors
