# Called after the machine has restored the saved gun and assigned its new tier.
$function zombies:combat/weapons/guns/bo3/registry/select_$(slot)
function zombies:combat/weapons/guns/bo3/inventory/capacity with storage zombies:bo3 profile
$scoreboard players operation @s ammo_$(slot) = @s max_ammo_$(slot)
$scoreboard players operation @s reserve_ammo_$(slot) = @s max_reserve_$(slot)
$scoreboard players set @s is_reloading_$(slot) 0
$scoreboard players set @s reload_timer_$(slot) 0
$scoreboard players set @s bo3_delay_$(slot) 0
function zombies:combat/weapons/guns/bo3/input/cancel
