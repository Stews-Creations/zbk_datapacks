# ===================================
# CUSTOM DOORS SUBMODULE - LOAD
# ===================================

# Scoreboards
scoreboard objectives add custom_door_id dummy "Custom Door Link ID"
scoreboard objectives add custom_door_anim dummy "Custom Door Animation"
scoreboard objectives add custom_door_speed dummy "Custom Door Anim Speed"
scoreboard objectives add cd_sign_anim dummy "CD Sign Animation Timer"
scoreboard objectives add custom_door_float dummy "Custom Door Float"
scoreboard objectives add custom_door_power dummy "Custom Door Power"
scoreboard objectives add cd_sign_uid dummy "CD Sign Unique ID"

# Initialize default values
function zombies:map_elements/custom_door/initialize

# Custom door egg trigger
scoreboard objectives add give_custom_door_egg trigger

# Custom door sign egg trigger
scoreboard objectives add give_cd_sign_egg trigger

# Highlight teams
team add highlight_green
team modify highlight_green color green

# Clean up any leftover highlight cubes from previous session
tag @e[tag=cd_zone_active] remove cd_zone_active
execute as @e[type=magma_cube,tag=cd_highlight_cube] run tp @s ~ -10000 ~
execute as @e[type=magma_cube,tag=cd_sign_highlight] run tp @s ~ -10000 ~
execute as @e[type=magma_cube,tag=cd_corner_highlight] run tp @s ~ -10000 ~
