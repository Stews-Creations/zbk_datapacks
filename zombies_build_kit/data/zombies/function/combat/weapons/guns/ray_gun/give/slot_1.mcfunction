function zombies:combat/weapons/reload_audio/stop_slot {slot:1}
# Give ray_gun to slot 1 (gun_1)
$scoreboard players set @s gun_1 $(id)
$scoreboard players set @s max_ammo_1 $(max_ammo)
scoreboard players operation @s ammo_1 = @s max_ammo_1
scoreboard players set @s shots_1 0
scoreboard players set @s fire_1 0
scoreboard players set @s cooldown_1 0
$scoreboard players set @s reserve_ammo_1 $(max_reserve)
$scoreboard players set @s max_reserve_1 $(max_reserve)
scoreboard players set @s is_reloading_1 0
scoreboard players set @s reload_timer_1 0
scoreboard players set @s tier_1 0
scoreboard players set @s element_1 0
