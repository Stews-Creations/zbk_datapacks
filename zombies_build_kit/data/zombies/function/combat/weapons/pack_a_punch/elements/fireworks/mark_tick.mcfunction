# Per-tick logic for a Fireworks-marked piglin.
# Run as @s = marked piglin (positioned at @s).

# Decrement timer
scoreboard players remove @s fw_kill_timer 1

# Trailing sparkles while waiting to die
particle minecraft:firework ~ ~1 ~ 0.2 0.3 0.2 0.05 2 force

# Trigger zombie launches one BLANK rocket every 5 ticks (6 total over the 30-tick window)
execute if entity @s[tag=fw_trigger_center] if score @s fw_kill_timer matches 27 run summon firework_rocket ~ ~0.2 ~ {Motion:[0.0,0.4,0.0],LifeTime:10,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{flight_duration:1,explosions:[{shape:"small_ball",colors:[I;16711680]}]}}}}
execute if entity @s[tag=fw_trigger_center] if score @s fw_kill_timer matches 22 run summon firework_rocket ~ ~0.2 ~ {Motion:[0.3,0.4,0.0],LifeTime:10,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{flight_duration:1,explosions:[{shape:"small_ball",colors:[I;16753920]}]}}}}
execute if entity @s[tag=fw_trigger_center] if score @s fw_kill_timer matches 17 run summon firework_rocket ~ ~0.2 ~ {Motion:[-0.3,0.4,0.0],LifeTime:10,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{flight_duration:1,explosions:[{shape:"small_ball",colors:[I;16776960]}]}}}}
execute if entity @s[tag=fw_trigger_center] if score @s fw_kill_timer matches 12 run summon firework_rocket ~ ~0.2 ~ {Motion:[0.0,0.4,0.3],LifeTime:10,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{flight_duration:1,explosions:[{shape:"small_ball",colors:[I;65280]}]}}}}
execute if entity @s[tag=fw_trigger_center] if score @s fw_kill_timer matches 7 run summon firework_rocket ~ ~0.2 ~ {Motion:[0.0,0.4,-0.3],LifeTime:10,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{flight_duration:1,explosions:[{shape:"small_ball",colors:[I;255]}]}}}}
execute if entity @s[tag=fw_trigger_center] if score @s fw_kill_timer matches 2 run summon firework_rocket ~ ~0.2 ~ {Motion:[0.2,0.4,0.2],LifeTime:10,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{flight_duration:1,explosions:[{shape:"small_ball",colors:[I;16711935]}]}}}}

# When timer hits 0, finish (kill + attribution)
execute if score @s fw_kill_timer matches 0 run function zombies:combat/weapons/pack_a_punch/elements/fireworks/finish
