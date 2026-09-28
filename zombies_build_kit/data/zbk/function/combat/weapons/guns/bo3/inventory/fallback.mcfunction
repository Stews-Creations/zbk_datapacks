function zbk:combat/weapons/reload_audio/stop_slot {slot:4}
scoreboard players set @s gun_4 20
scoreboard players set @s tier_4 0
scoreboard players set @s element_4 0
function zbk:combat/weapons/guns/bo3/registry/select_4
function zbk:combat/weapons/guns/bo3/inventory/capacity with storage zbk:bo3 profile
scoreboard players operation @s ammo_4 = @s max_ammo_4
scoreboard players operation @s reserve_ammo_4 = @s max_reserve_4
scoreboard players set @s is_reloading_4 0
scoreboard players set @s reload_timer_4 0
scoreboard players set @s bo3_delay_4 0
