# Context: one sign display; consume the location snapshot without another marker search.

execute if score #de_pap_sign_location global matches 0 run data modify entity @s item.components."minecraft:item_model" set value "zbk_der_eisendrache:de_pack_location_sign_empty"
execute if score #de_pap_sign_location global matches 1 run data modify entity @s item.components."minecraft:item_model" set value "zbk_der_eisendrache:de_pack_location_sign_bastion"
execute if score #de_pap_sign_location global matches 2 run data modify entity @s item.components."minecraft:item_model" set value "zbk_der_eisendrache:de_pack_location_sign_undercroft"
execute if score #de_pap_sign_location global matches 3 run data modify entity @s item.components."minecraft:item_model" set value "zbk_der_eisendrache:de_pack_location_sign_rocket_pad"
