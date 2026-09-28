# ===================================
# EXPLOSIVE BARREL - DAMAGE WOLF
# ===================================
# Purpose: Apply explosion damage to a wolf in barrel explosion radius
# Called as @s = the wolf, at @s = wolf position
# No points awarded (barrel kills don't give points to anyone)

execute if entity @s[tag=immune_explosives] run return fail

# Insta-kill: massive damage
execute if score global insta_kill matches 1 run damage @s 10000 minecraft:generic
execute if score global insta_kill matches 1 run return 0

# Normal: 200 flat damage
damage @s 200 minecraft:generic

# Blood particles
particle minecraft:block{block_state:{Name:"minecraft:redstone_block"}} ~ ~ ~ 0.5 0.5 0.5 2 30
