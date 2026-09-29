# === SOLO SELF-REVIVE ===
# Called when downed player has Quick Revive in solo mode
# Auto-revives without needing a teammate

# Build bossbar args for this specific downed player
execute store result storage zbk:temp revive_bar.player_id int 1 run scoreboard players get @s id
data modify storage zbk:temp revive_bar.max set value 100

# Increase the revive timer (auto self-revive)
scoreboard players add @s revive_timer 1

# Update and display only this downed player's bossbar to self
execute store result storage zbk:temp revive_bar.value int 1 run scoreboard players get @s revive_timer
tag @s add revive_bar_viewer_tmp
function zbk:player/down_system/bossbar/update with storage zbk:temp revive_bar
tag @s remove revive_bar_viewer_tmp

# Complete revive after 40 ticks
execute if score @s revive_timer matches 100.. run function zbk:player/down_system/lifecycle/on_revive
