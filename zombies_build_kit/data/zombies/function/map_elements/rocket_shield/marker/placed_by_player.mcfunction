# The successful egg-use event runs synchronously as the actual placing player.
# Capture before the shared tick registers markers; never infer a nearby player.
advancement revoke @s only zombies:rocket_shield_part_placement
data modify storage zombies:shield_parts placement.rotation set from entity @s Rotation
data modify storage zombies:shield_parts placement.rotation[1] set value 0f
execute at @s as @e[type=marker,tag=rs_placement_pending,tag=rs_candidate_new,distance=..8,sort=nearest,limit=1] at @s run function zombies:map_elements/rocket_shield/marker/apply_facing
