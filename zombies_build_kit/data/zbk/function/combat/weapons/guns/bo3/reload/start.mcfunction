$execute if score @s is_reloading_$(slot) matches 1 run return 0
$execute unless score @s reserve_ammo_$(slot) matches 1.. run return 0
$execute if score @s ammo_$(slot) >= @s max_ammo_$(slot) run return 0
$scoreboard players set @s is_reloading_$(slot) 1
$scoreboard players set @s bo3_burst_$(slot) 0
$scoreboard players set @s reload_timer_$(slot) $(reload_ticks)
$execute if score @s ammo_$(slot) matches ..0 run scoreboard players set @s reload_timer_$(slot) $(reload_empty_ticks)
$scoreboard players set #shell_reload stats $(shell_reload)
$execute if score #shell_reload stats matches 1 run scoreboard players add @s reload_timer_$(slot) 22
$execute if score @s perk_speed matches 1.. run scoreboard players operation @s reload_timer_$(slot) /= #2 stats
function zbk:combat/weapons/reload_audio/start with storage zbk:bo3 profile

function zbk:combat/weapons/events/voice_event_reload
