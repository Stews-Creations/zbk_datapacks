# Player executor, clicked interaction position retained for range checks.
$execute if entity @s[distance=..3] if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run function zombies:build_kit/management/buildables/open_clicked_part {id:$(id)}
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run return 0
execute unless entity @s[distance=..3] at @s rotated as @s run return run function zombies:combat/weapons/mechanics/input/interaction_use
execute if entity @s[team=downed] run return 0
$function zombies:map_elements/rocket_shield/management/collect {part:"$(part)"}
