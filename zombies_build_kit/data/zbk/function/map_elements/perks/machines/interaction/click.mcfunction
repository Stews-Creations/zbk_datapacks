execute if entity @s[team=downed] run return fail
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run return run function zbk:map_elements/perks/machines/interaction/manage
execute if entity @e[type=marker,tag=pm_v2_selected,tag=perk_juggernog] run return run function zbk:map_elements/perks/juggernog/buy
execute if entity @e[type=marker,tag=pm_v2_selected,tag=perk_stamina_up] run return run function zbk:map_elements/perks/stamina_up/buy
execute if entity @e[type=marker,tag=pm_v2_selected,tag=perk_speed_cola] run return run function zbk:map_elements/perks/speed_cola/buy
execute if entity @e[type=marker,tag=pm_v2_selected,tag=perk_double_tap] run return run function zbk:map_elements/perks/double_tap/buy
execute if entity @e[type=marker,tag=pm_v2_selected,tag=perk_quick_revive] run return run function zbk:map_elements/perks/quick_revive/buy
execute if entity @e[type=marker,tag=pm_v2_selected,tag=perk_mule_kick] run return run function zbk:map_elements/perks/mule_kick/buy
