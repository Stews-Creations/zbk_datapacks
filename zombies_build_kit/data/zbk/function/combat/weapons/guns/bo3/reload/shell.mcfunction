# KRM transfers one shell at a time; a fresh trigger can interrupt after loading a shell.
$execute if score @s ammo_$(slot) >= @s max_ammo_$(slot) run scoreboard players set @s is_reloading_$(slot) 0
$execute if score @s reserve_ammo_$(slot) matches ..0 run scoreboard players set @s is_reloading_$(slot) 0
$execute if score @s is_reloading_$(slot) matches 0 run return 0
$execute if score @s reserve_ammo_$(slot) matches 1.. if score @s ammo_$(slot) < @s max_ammo_$(slot) run scoreboard players add @s ammo_$(slot) 1
$execute if score @s reserve_ammo_$(slot) matches 1.. run scoreboard players remove @s reserve_ammo_$(slot) 1
$scoreboard players set @s reload_timer_$(slot) $(reload_ticks)
$execute if score @s perk_speed matches 1.. run scoreboard players operation @s reload_timer_$(slot) /= #2 stats
$execute if score @s ammo_$(slot) >= @s max_ammo_$(slot) run scoreboard players set @s is_reloading_$(slot) 0
$execute if score @s reserve_ammo_$(slot) matches ..0 run scoreboard players set @s is_reloading_$(slot) 0
$execute if score @s is_reloading_$(slot) matches 1 run function zbk:combat/weapons/reload_audio/shell with storage zbk:bo3 profile
