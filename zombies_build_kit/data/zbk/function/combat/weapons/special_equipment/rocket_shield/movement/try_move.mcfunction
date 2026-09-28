# The caller positions us at the proposed landing with the player's horizontal facing.
scoreboard players set @s rs_step_clear 1
function zbk:combat/weapons/special_equipment/rocket_shield/movement/probe
execute if score @s rs_step_clear matches 1 store success score @s rs_step_moved run tp @s ~ ~ ~
