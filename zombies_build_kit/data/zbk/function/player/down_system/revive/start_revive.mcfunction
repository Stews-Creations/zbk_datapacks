# Make both the downed player and all nearby teammates see the revive bar
execute store result storage zbk:temp revive_bar.player_id int 1 run scoreboard players get @s id
execute unless entity @p[team=!downed,distance=..4,scores={perk_revive=1..}] run data modify storage zbk:temp revive_bar.max set value 100
execute if entity @p[team=!downed,distance=..4,scores={perk_revive=1..}] run data modify storage zbk:temp revive_bar.max set value 40

# Increase the revive timer for the downed player
execute if entity @a[team=!downed,distance=..4] run scoreboard players add @s revive_timer 1

# Update and display only this downed player's bossbar to scoped viewers
execute store result storage zbk:temp revive_bar.value int 1 run scoreboard players get @s revive_timer
tag @s add revive_bar_viewer_tmp
execute at @s run tag @a[team=!downed,gamemode=adventure,distance=..4] add revive_bar_viewer_tmp
function zbk:player/down_system/bossbar/update with storage zbk:temp revive_bar
tag @a[tag=revive_bar_viewer_tmp] remove revive_bar_viewer_tmp

# Normal revive = 100 ticks, Quick Revive = 40 ticks
execute if entity @p[team=!downed,distance=..4,scores={perk_revive=1..}] if score @s revive_timer matches 40.. run function zbk:player/down_system/lifecycle/on_revive
execute if entity @p[team=!downed,distance=..4] if score @s revive_timer matches 100.. run function zbk:player/down_system/lifecycle/on_revive
