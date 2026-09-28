execute as @s run function zbk:map_elements/perks/management/clear_player_perks
team join no_friendly_fire_team @s
ride @s dismount
scoreboard players reset @s downed_timer
scoreboard players reset @s downed_timer_seconds
scoreboard players reset @s revive_timer
effect clear @s
execute store result storage zbk:temp revive_bar.player_id int 1 run scoreboard players get @s id
function zbk:player/down_system/bossbar/remove with storage zbk:temp revive_bar
scoreboard players operation #downed_id id = @s id
execute as @e[type=armor_stand,tag=downed_body] if score @s id = #downed_id id run kill @s
effect give @s minecraft:instant_health 1 200 true

# Clean up solo down decoys (safe to call even if none exist)
function zbk:player/down_system/cleanup_solo_decoys
