# ===================================
# EXPLOSIVE BARREL - DAMAGE ZOMBIE
# ===================================
# Purpose: Apply explosion damage to a zombie in barrel explosion radius
# Called as @s = the zombified_piglin, at @s = zombie position
# No points awarded (barrel kills don't give points to anyone)

execute if entity @s[tag=immune_explosives] run return fail

# Insta-kill: set health to 0
execute if score global insta_kill matches 1 run data modify entity @s Health set value 0.0f
execute if score global insta_kill matches 1 run return 0

# Normal: 200 flat damage
execute store result score #health stats run data get entity @s Health
scoreboard players remove #health stats 200
execute store result entity @s Health float 1 run scoreboard players get #health stats

# Blood particles
particle minecraft:block{block_state:{Name:"minecraft:redstone_block"}} ~ ~ ~ 0.5 0.5 0.5 2 30

# Clean up crawler display if it died
execute store result score #health stats run data get entity @s Health
execute if score #health stats matches ..0 if entity @s[tag=crawler_ai] run function zombies:behavior/crawler/remove_paired_display
