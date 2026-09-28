# Bounded 0.25-block ray from the actual attacker's eyes to the target's body.
execute unless block ~ ~ ~ #zombies:rocket_shield_air run return 0
execute positioned ~ ~-1.3 ~ if entity @a[tag=rs_guard_target,distance=..0.6] run return run scoreboard players set #rs_visible temp 1
scoreboard players remove #rs_trace temp 1
execute if score #rs_trace temp matches 1.. positioned ^ ^ ^0.25 run function zombies:combat/weapons/special_equipment/rocket_shield/protection/trace
