# Clear retired mob modifiers from a loaded enemy during reload or reset.
# Run as an affected entity; preserve all other systems' attribute modifiers.
execute unless entity @s[tag=de_ag_mob_effects] run return 0

attribute @s minecraft:gravity modifier remove zombies:anti_gravity_mob
attribute @s minecraft:movement_speed modifier remove zombies:anti_gravity_mob_speed
tag @s remove de_ag_mob_effects
tag @s remove de_ag_mob_near
