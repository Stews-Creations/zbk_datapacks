# Keep the fog pumpkin equipped without rewriting an unchanged item each tick.
execute unless items entity @s armor.head minecraft:carved_pumpkin[custom_model_data~{flags:[true]}] run item replace entity @s armor.head with minecraft:carved_pumpkin[custom_model_data={flags:[true,false]}]
function zombies:combat/weapons/special_equipment/rocket_shield/display/update_dog_pumpkin
