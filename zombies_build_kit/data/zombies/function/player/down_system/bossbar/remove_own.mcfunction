# Remove this player's own revive bossbar (called as each player)
execute store result storage zombies:temp revive_bar.player_id int 1 run scoreboard players get @s id
function zombies:player/down_system/bossbar/remove with storage zombies:temp revive_bar
