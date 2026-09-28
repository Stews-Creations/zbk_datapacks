# Moves a Panzer electric projectile and checks for player/block hits.
# Runs as and at: panzer_electric_projectile item_display.

execute if score @s panzer_electric_lifetime matches ..0 run return run function zbk:bosses/panzer/attacks/range/projectile/remove
execute unless block ~ ~ ~ #zbk:raycast_pass run return run function zbk:bosses/panzer/attacks/range/projectile/impact

particle minecraft:electric_spark ~ ~ ~ 0.06 0.06 0.06 0.08 5 force
particle minecraft:dust{color:[0.25,0.9,1.0],scale:0.55} ~ ~ ~ 0.03 0.03 0.03 0 2 force
scoreboard players set #panzer_electric_hit temp 0
execute positioned ~-0.35 ~-0.35 ~-0.35 as @a[gamemode=adventure,team=!downed,dx=0.7,dy=0.7,dz=0.7,sort=nearest,limit=1] at @s run function zbk:bosses/panzer/attacks/range/projectile/hit
execute if score #panzer_electric_hit temp matches 1.. run return run function zbk:bosses/panzer/attacks/range/projectile/remove

tp @s ^ ^ ^0.85
execute unless block ~ ~ ~ #zbk:raycast_pass run return run function zbk:bosses/panzer/attacks/range/projectile/impact
scoreboard players set #panzer_electric_hit temp 0
execute positioned ~-0.35 ~-0.35 ~-0.35 as @a[gamemode=adventure,team=!downed,dx=0.7,dy=0.7,dz=0.7,sort=nearest,limit=1] at @s run function zbk:bosses/panzer/attacks/range/projectile/hit
execute if score #panzer_electric_hit temp matches 1.. run return run function zbk:bosses/panzer/attacks/range/projectile/remove

scoreboard players remove @s panzer_electric_lifetime 1
execute if score @s panzer_electric_lifetime matches ..0 run function zbk:bosses/panzer/attacks/range/projectile/remove
