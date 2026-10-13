# Separate multiplier preserves base damage, Bowie and other buff modifiers.
execute unless score @s perk_widows matches 1.. run return run function zbk:map_elements/perks/widows_wine/effects/clear_knife
execute unless items entity @s weapon.mainhand *[custom_data~{knife:true}] run return run function zbk:map_elements/perks/widows_wine/effects/clear_knife
execute if entity @s[tag=ww_knife_boost] run return 0
attribute @s minecraft:attack_damage modifier add zbk:widows_knife 2 add_multiplied_total
tag @s add ww_knife_boost
