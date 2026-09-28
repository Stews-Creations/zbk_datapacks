# Spawns the visible electric projectile at the Panzer throw release point.
# Runs as: panzer_ai iron golem, positioned at the claw and facing the target.

summon minecraft:item_display ~ ~ ~ {Tags:["panzer_electric_projectile","panzer_electric_projectile_new"],teleport_duration:1,interpolation_duration:1,item:{id:"minecraft:lightning_rod"},item_display:"fixed",transformation:{translation:[0f,0f,0f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[0.42f,0.42f,0.42f]}}
execute as @e[type=minecraft:item_display,tag=panzer_electric_projectile_new,distance=..0.25,sort=nearest,limit=1] run function zombies:bosses/panzer/attacks/range/projectile/setup
particle minecraft:electric_spark ~ ~ ~ 0.2 0.2 0.2 0.35 18 force
particle minecraft:dust{color:[0.2,0.85,1.0],scale:0.9} ~ ~ ~ 0.08 0.08 0.08 0 8 force
playsound zbk:mob.panzer.electric_throw hostile @a[distance=..48] ~ ~ ~ 1 1
