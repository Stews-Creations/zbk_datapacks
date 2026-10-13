scoreboard players operation #current_grenade_id grenade_id = @s grenade_id
execute as @e[type=item_display,tag=grenade_display] if score @s grenade_id = #current_grenade_id grenade_id run kill @s
kill @s
