# Applies a Panzer flamethrower hit only if the nozzle has line of sight to the candidate player.
# Runs as: candidate player, positioned at the flame damage sample, rotated along the flame stream.

scoreboard players set #panzer_flame_los_steps temp 140
scoreboard players set #panzer_flame_los_clear temp 0
$execute positioned ^ ^0.9 ^-$(distance) facing entity @s feet positioned ^ ^ ^0.1 run function zombies:bosses/panzer/attacks/flame_thrower/line_of_sight
execute if score #panzer_flame_los_clear temp matches 1 at @s run function zombies:bosses/panzer/attacks/flame_thrower/apply_hit
