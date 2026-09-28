# Remove the obsolete durability presentation from a displayed gun.
execute if items entity @s weapon.offhand minecraft:ghast_tear[custom_data~{gun:true},max_damage=13] run item modify entity @s weapon.offhand {function:"minecraft:set_components",components:{"!minecraft:damage":{},"!minecraft:max_damage":{},"minecraft:max_stack_size":64}}
