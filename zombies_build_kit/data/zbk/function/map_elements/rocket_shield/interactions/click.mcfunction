# Player executor, clicked interaction position retained for range checks.
$execute if entity @s[distance=..3] if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run function zbk:map_elements/rocket_shield/build_kit/open_clicked_part {id:$(id)}
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run return 0
execute unless entity @s[distance=..3] at @s rotated as @s run return run function zbk:combat/weapons/mechanics/input/interaction_use
execute if entity @s[team=downed] run return 0
$function zbk:map_elements/rocket_shield/management/collect {part:"$(part)"}
