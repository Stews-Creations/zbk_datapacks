# Read-only diagnostics deliberately work even when another map is selected.
tellraw @s [{"text":"[Anti-Gravity Recovery] ","color":"light_purple"},{"text":"No running game or room activation is required. Creative, Survival, and Adventure are supported.","color":"gray"}]
execute if score #active zbk.de matches 1 run tellraw @s {"text":"Map: Der Eisendrache selected.","color":"green"}
execute unless score #active zbk.de matches 1 run tellraw @s {"text":"BLOCKED: Select Der Eisendrache (Der Eisendrache).","color":"red"}
execute if entity @s[tag=disable_tp] run tellraw @s {"text":"BLOCKED: Disable TP is ON. To allow recovery, run /tag @s remove disable_tp.","color":"red"}
execute if entity @s[gamemode=spectator] run tellraw @s {"text":"BLOCKED: Spectator mode bypasses recovery.","color":"red"}
execute if entity @s[tag=115_launch_flying] run tellraw @s {"text":"BLOCKED: A 115 launch flight is in progress.","color":"red"}
execute if block ~ ~ ~ minecraft:light[level=2] run tellraw @s {"text":"Detection: Your feet are inside a level-2 light block.","color":"green"}
execute unless block ~ ~ ~ minecraft:light[level=2] run tellraw @s {"text":"Detection: Your feet are not inside a level-2 light block. Put the light blocks in the space players enter, above the floor.","color":"yellow"}
execute if entity @s[scores={de_ag_bound_cd=1..}] run tellraw @s [{"text":"Recovery cooldown remaining: ","color":"yellow"},{"score":{"name":"@s","objective":"de_ag_bound_cd"}},{"text":" ticks."}]
execute if score #room de_ag_state matches 1 if entity @s[tag=de_ag_inside,tag=!de_ag_suppressed] run tellraw @s {"text":"Movement exemptions: Active; rising jumps, air-jump pulses, and owned wall-run support are allowed.","color":"gray"}
execute unless entity @e[type=minecraft:marker,tag=de_ag_recovery,distance=..32] run tellraw @s {"text":"BLOCKED: No recovery marker within 32 blocks in this dimension.","color":"red"}
execute unless entity @e[type=minecraft:marker,tag=de_ag_recovery,distance=..32] run return 0
execute store result score #bound_valid de_ag_motion positioned as @e[type=minecraft:marker,tag=de_ag_recovery,distance=..32,sort=nearest,limit=1] run function zbk_der_eisendrache:anti_gravity/validation/recovery_destination
execute if score #bound_valid de_ag_motion matches 1 run tellraw @s {"text":"Destination: Nearest recovery marker passes clearance checks.","color":"green"}
execute unless score #bound_valid de_ag_motion matches 1 run tellraw @s {"text":"BLOCKED: The nearest recovery marker fails clearance checks. Re-place it on safe full-block ground with standing room, outside level-2, level-5, and level-6 light blocks.","color":"red"}
