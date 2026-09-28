# Only remove our cosmetic; leave helmets, pumpkins, and the slot-6 shield alone.
execute if items entity @s armor.head *[custom_data~{rs_head_cosmetic:true}] run item replace entity @s armor.head with minecraft:air
execute if items entity @s armor.head minecraft:carved_pumpkin[custom_model_data={flags:[true,true]}] run item modify entity @s armor.head zbk:rocket_shield_dog_hidden
