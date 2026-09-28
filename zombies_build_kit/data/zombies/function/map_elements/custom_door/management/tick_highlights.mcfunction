# Group only presentation for highlighted markers; linked-door open/close decisions stay separate.

# Mark proximity for all players before processing linked pairs; clear it after all decisions.
execute as @a at @s if items entity @s weapon.mainhand minecraft:stick[custom_data~{build_manager:true}] run tag @e[type=marker,tag=custom_door,distance=..15,limit=1,sort=nearest] add cd_player_nearby

# Process nearby candidates first, then active highlights that may need clearing.
# Keep all players' proximity tags until both passes finish so linked pairs remain highlighted.
execute as @e[type=marker,tag=custom_door,tag=cd_player_nearby] run function zombies:map_elements/custom_door/management/tick_highlight
execute as @e[type=marker,tag=custom_door,tag=cd_zone_active,tag=!cd_player_nearby] run function zombies:map_elements/custom_door/management/tick_highlight

# Clear proximity tags
tag @e[type=marker,tag=cd_player_nearby] remove cd_player_nearby
