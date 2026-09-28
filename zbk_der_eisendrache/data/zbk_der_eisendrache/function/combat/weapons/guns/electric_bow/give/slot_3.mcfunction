# Give electric_bow to slot 3 (gun_3)
# Uses macro to read gun data passed from parent function
$scoreboard players set @s gun_3 $(id)
$scoreboard players set @s max_ammo_3 $(max_ammo)
scoreboard players operation @s ammo_3 = @s max_ammo_3
scoreboard players set @s shots_3 0
scoreboard players set @s fire_3 0
scoreboard players set @s cooldown_3 0
# Electric bow has no reserve/reload - all ammo is direct
scoreboard players set @s reserve_ammo_3 0
scoreboard players set @s max_reserve_3 0
scoreboard players set @s is_reloading_3 0
scoreboard players set @s reload_timer_3 0
scoreboard players set @s tier_3 0
scoreboard players set @s element_3 0
