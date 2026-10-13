scoreboard players remove @s ww_fuse 1
scoreboard players operation #current_grenade_id grenade_id = @s grenade_id
execute at @s as @e[type=item_display,tag=grenade_display] if score @s grenade_id = #current_grenade_id grenade_id run tp @s ~ ~ ~
execute if score @s ww_fuse matches ..0 at @s run function zbk:combat/weapons/grenade/effects/explode
