# ===================================
# EXPLODE MONKEY BOMB
# ===================================
# Called as the monkey bomb item_display when its timer expires.

scoreboard players operation #current_grenade_id grenade_id = @s grenade_id
execute as @e[type=zombie,tag=monkey_bomb_decoy] if score @s grenade_id = #current_grenade_id grenade_id run kill @s
execute as @e[type=marker,tag=monkey_bomb_marker] if score @s grenade_id = #current_grenade_id grenade_id at @s run function zbk:combat/weapons/grenade/explode
kill @s
