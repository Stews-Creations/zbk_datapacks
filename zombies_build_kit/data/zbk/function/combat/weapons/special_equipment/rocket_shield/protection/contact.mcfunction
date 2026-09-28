# Player target; execution position still belongs to attacker. Trace before damage.
tag @s add rs_guard_target
scoreboard players set #rs_trace temp 12
scoreboard players set #rs_visible temp 0
execute as @e[tag=rs_attack_source,limit=1] at @s anchored eyes facing entity @a[tag=rs_guard_target,limit=1] eyes positioned ^ ^ ^0.1 anchored feet run function zbk:combat/weapons/special_equipment/rocket_shield/protection/trace
execute if score #rs_visible temp matches 1 at @s run function zbk:combat/weapons/special_equipment/rocket_shield/protection/attack
tag @s remove rs_guard_target
