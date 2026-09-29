# Run as the map-owned enemy to include it in shared round completion and kill reporting.
execute unless entity @s run return 0
tag @s add wave_enemy
tag @s remove zbk.kill_reported
