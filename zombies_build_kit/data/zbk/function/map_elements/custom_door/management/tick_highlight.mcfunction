# Context: selected highlight marker at its position.
# Keep all applicable local effects; a tag match must not suppress a later matching effect.

execute if entity @s[tag=cd_player_nearby,tag=!cd_zone_active] run function zbk:build_kit/management/custom_door/highlight/auto_on
execute if entity @s[tag=cd_zone_active,tag=!cd_player_nearby] run function zbk:build_kit/management/custom_door/highlight/auto_off
