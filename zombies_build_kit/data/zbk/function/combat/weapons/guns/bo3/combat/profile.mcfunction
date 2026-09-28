# Override the active-slot inference for downed owned MR6 and the independent fallback.
$scoreboard players set #tier stats $(tier)
$scoreboard players operation #element stats = @s element_$(slot)
$scoreboard players set #bo3_min stats $(min_damage)
$scoreboard players set #bo3_start stats $(range_start)
$scoreboard players set #bo3_end stats $(range_end)
$scoreboard players set #bo3_head stats $(head_percent)
$scoreboard players set #bo3_pellets stats $(pellets)
scoreboard players set #100 stats 100
scoreboard players set #ray_limit stats 600
execute if score #gun_id stats matches 43..46 run scoreboard players set #ray_limit stats 1000
execute if score #gun_id stats matches 39..42 run scoreboard players set #ray_limit stats 200
execute if score #gun_id stats matches 46 run return run function zbk:combat/weapons/guns/bo3/projectile/spawn
execute if score #bo3_pellets stats matches 1 run return run function zbk:combat/weapons/mechanics/raycast/raycast
# Four deterministic pellet rays, with shell damage divided across them.
execute rotated ~-1.4 ~-0.7 run function zbk:combat/weapons/guns/bo3/combat/pellet
execute rotated ~1.4 ~-0.7 run function zbk:combat/weapons/guns/bo3/combat/pellet
execute rotated ~-0.7 ~1.4 run function zbk:combat/weapons/guns/bo3/combat/pellet
execute rotated ~0.7 ~1.4 run function zbk:combat/weapons/guns/bo3/combat/pellet
tag @e[tag=bo3_shell_hit] remove bo3_shell_hit
