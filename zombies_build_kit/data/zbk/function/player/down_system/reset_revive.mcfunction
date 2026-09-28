# Reset their revive progress
scoreboard players set @s revive_timer 0

# Remove only this downed player's revive bossbar
execute store result storage zbk:temp revive_bar.player_id int 1 run scoreboard players get @s id
function zbk:player/down_system/bossbar/remove with storage zbk:temp revive_bar
