# Dog rounds keep their fog pumpkin and select a shield-rendering variant.
execute if score #global wave.is_dog_round matches 1 run return run function zombies:combat/weapons/special_equipment/rocket_shield/display/update_dog_pumpkin
execute store result score #can_stow rs_owned run function zombies:combat/weapons/special_equipment/rocket_shield/validation/can_stow
execute if score #can_stow rs_owned matches 0 run return run function zombies:combat/weapons/special_equipment/rocket_shield/display/clear
execute if items entity @s armor.head *[custom_data~{rs_head_cosmetic:true}] run return 0
function zombies:combat/weapons/special_equipment/rocket_shield/display/equip_head
