# One-time Panzer controller setup.

attribute @s minecraft:movement_speed base set 0.3
attribute @s minecraft:step_height base set 2
attribute @s minecraft:safe_fall_distance base set 3
function zombies:bosses/panzer/ai/disable_vanilla_attack
effect give @s minecraft:invisibility infinite 0 true
tag @s add panzer_attrs_applied
