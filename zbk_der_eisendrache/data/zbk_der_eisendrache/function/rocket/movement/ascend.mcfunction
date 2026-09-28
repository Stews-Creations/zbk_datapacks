# Emit particles and move the rocket up 1 block each tick (20 blocks per second)
execute as @e[type=minecraft:block_display,tag=rocket_root,limit=1] at @s run function zbk_der_eisendrache:rocket/effects/booster_particles
execute as @e[type=minecraft:block_display,tag=rocket_move] at @s run tp @s ~ ~1 ~

# Track height
scoreboard players add #rocket rocket_height 1

# After 250 blocks, clean up
execute if score #rocket rocket_height matches 250.. run function zbk_der_eisendrache:rocket/effects/cleanup
