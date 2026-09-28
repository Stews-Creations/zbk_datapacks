# Player victim, with exactly one synchronous rs_attack_source.
scoreboard players set @e[tag=rs_attack_source,limit=1] rs_attack_cd 20
execute store result score #rs_blocked temp run function zombies:combat/weapons/special_equipment/rocket_shield/protection/try_block
execute if score #rs_blocked temp matches 1 run return 0
execute store result storage zombies:shield_attack damage double 0.001 run scoreboard players get @e[tag=rs_attack_source,limit=1] rs_native_damage
function zombies:combat/weapons/special_equipment/rocket_shield/protection/apply_damage with storage zombies:shield_attack
