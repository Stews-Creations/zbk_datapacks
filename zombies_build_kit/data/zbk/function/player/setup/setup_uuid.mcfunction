execute as @s at @s store result score @s id run scoreboard players add #new id 1

# Initialize game stats to 0 for new player
scoreboard players set @s stat_kills 0
scoreboard players set @s stat_downs 0
scoreboard players set @s stat_revives 0
scoreboard players set @s stat_headshots 0
scoreboard players set @s stat_doors 0

# Setup custom scoreboard display format with player head
function zbk:player/setup/setup_scoreboard_format

# Initialize all per-player scoreboards, triggers, and weapons
function zbk:player/setup/setup_player
