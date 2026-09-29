# Apply the packed-ammo price to the invoking builder's nearest wall marker.
$scoreboard players set #selected_pap_ammo_price global $(pap_ammo_price)
execute unless score #selected_pap_ammo_price global matches 0..10000 run return 0
execute unless entity @e[type=marker,tag=wall_gun,distance=..5,limit=1,sort=nearest] run return 0
execute store result entity @e[type=marker,tag=wall_gun,distance=..5,limit=1,sort=nearest] data.pap_ammo_price int 1 run scoreboard players get #selected_pap_ammo_price global
schedule function zbk:map_elements/wall_gun/initialize 1t
execute if entity @s[tag=debug,scores={debug_level=4..}] run tellraw @s[tag=debug] [{"text":"[Build Manager] ","color":"gold"},{"text":"Pack-a-Punch ammo price set to ","color":"green"},{"score":{"name":"#selected_pap_ammo_price","objective":"global"},"color":"light_purple","bold":true}]
function zbk:map_elements/wall_gun/build_kit/dialogs/open_config_dialog_refresh
