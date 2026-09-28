# Clear transient air-jump state on exit, suppression, or deactivation.
execute if score @s de_ag_jump_t matches 1.. run effect clear @s minecraft:levitation
scoreboard players set @s de_ag_jump_t 0
tag @s remove de_ag_air_jump_ready
tag @s remove de_ag_sneak_held
