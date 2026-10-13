# Target executor, ray impact position; shooter is identified by #player stats.
# Recompute per victim/pellet so another player or an explosive cannot inherit it.
tag @s remove headshot_hit
execute if entity @s[distance=1.65..] run tag @s add headshot_hit
scoreboard players set #deadshot_hit stats 0
execute unless score #is_explosive stats matches 1 as @a[scores={perk_deadshot=1..}] if score @s id = #player stats run scoreboard players set #deadshot_hit stats 1
execute if score #deadshot_hit stats matches 1 run tag @s add headshot_hit
