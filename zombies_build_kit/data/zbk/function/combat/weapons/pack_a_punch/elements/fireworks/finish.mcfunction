# Finish a Fireworks-marked kill: drop loot, credit shooter (half), kill victim.
# Run as @s = marked piglin (positioned at @s).

execute if entity @s[tag=immune_elements] run return 0

# Stash victim's stored shooter id so @a iteration can match
scoreboard players operation #fw_kill_shooter stats = @s fw_shooter_id

# Award HALF kill points to original shooter
execute as @a if score @s id = #fw_kill_shooter stats run function zbk:player/points/add_half_kill_points

# Drop loot at victim position
scoreboard players operation #map_killer temp = #fw_kill_shooter stats
execute at @s run function zbk:combat/enemies/lifecycle/killed
loot spawn ~ ~ ~ loot entities/zombified_piglin

# Finale: trigger zombie spawns ONE big multi-color firework explosion at the kill moment
execute if entity @s[tag=fw_trigger_center] run summon firework_rocket ~ ~1 ~ {LifeTime:1,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{flight_duration:1,explosions:[{shape:"small_ball",colors:[I;16711680,16753920,16776960,65280,255,16711935],fade_colors:[I;16777215],has_trail:1b,has_twinkle:1b}]}}}}

# Per-victim subtle accent
particle minecraft:firework ~ ~1 ~ 0.3 0.5 0.3 0.05 8 force

# Kill
kill @s
