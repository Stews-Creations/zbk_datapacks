# Ray Gun trigger lock countdown - runs every tick via ray_gun_cooldown advancement
scoreboard players remove @s ray_gun_trigger_lock 1
execute if score @s ray_gun_trigger_lock matches 1.. run return run advancement revoke @s only zbk:ray_gun_cooldown
scoreboard players reset @s ray_gun_trigger_lock
