# Give bow to slot 2 (gun_2)
# Uses macro to read gun data passed from parent function
$scoreboard players set @s gun_2 $(id)
$scoreboard players set @s max_ammo_2 $(max_ammo)
scoreboard players operation @s ammo_2 = @s max_ammo_2
scoreboard players set @s shots_2 0
scoreboard players set @s fire_2 0
scoreboard players set @s cooldown_2 0
# Bow has no reserve/reload - all ammo is direct
scoreboard players set @s reserve_ammo_2 0
scoreboard players set @s max_reserve_2 0
scoreboard players set @s is_reloading_2 0
scoreboard players set @s reload_timer_2 0
scoreboard players set @s tier_2 0
scoreboard players set @s element_2 0
