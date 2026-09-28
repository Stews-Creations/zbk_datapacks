# Keep the actual fog pumpkin equipped; change its visual flag only on transitions.
execute unless items entity @s armor.head minecraft:carved_pumpkin[custom_model_data~{flags:[true]}] run return 0
execute store result score #dog_stowed rs_owned run function zbk:combat/weapons/special_equipment/rocket_shield/validation/can_stow
execute if score #dog_stowed rs_owned matches 1 unless items entity @s armor.head minecraft:carved_pumpkin[custom_model_data={flags:[true,true]}] run item modify entity @s armor.head zbk:rocket_shield_dog_stowed
execute if score #dog_stowed rs_owned matches 0 unless items entity @s armor.head minecraft:carved_pumpkin[custom_model_data={flags:[true,false]}] run item modify entity @s armor.head zbk:rocket_shield_dog_hidden
