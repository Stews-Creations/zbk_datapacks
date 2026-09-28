# ===================================
# PLAYER STATS MODULE - INITIALIZE
# ===================================
# Purpose: Reset all stats to 0 for a new game
# Called from: game/management/start.mcfunction (NOT from game/initialize)

scoreboard players set @a stat_kills 0
scoreboard players set @a stat_downs 0
scoreboard players set @a stat_revives 0
scoreboard players set @a stat_headshots 0
scoreboard players set @a stat_doors 0
