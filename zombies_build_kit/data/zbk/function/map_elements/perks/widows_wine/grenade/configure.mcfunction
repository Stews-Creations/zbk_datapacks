tag @s add widows_grenade
scoreboard players operation #ww_grenade grenade_id = @s grenade_id
execute as @e[type=item_display,tag=grenade_display] if score @s grenade_id = #ww_grenade grenade_id run data modify entity @s item.components."minecraft:item_model" set value "zbk:special_equipment/widows_grenade"
