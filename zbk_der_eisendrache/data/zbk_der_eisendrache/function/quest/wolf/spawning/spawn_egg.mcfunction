# Give wolf painting location marker egg
# Place this egg where you want a potential wolf painting spawn location

execute unless score #active zbk.de matches 1 run return 0

give @s minecraft:wolf_spawn_egg[custom_name=[{"text":"Wolf Painting Location","italic":false,"color":"gold"}]] 1
