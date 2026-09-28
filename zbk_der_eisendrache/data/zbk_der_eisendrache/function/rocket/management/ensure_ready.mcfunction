# DER EISENDRACHE ROCKET - START GATE
# Checks that the active map has a reconstructed rocket.
scoreboard players set #rocket_ready global 1
execute unless score #active zbk.de matches 1 run return 1

# Recreate a missing rocket synchronously before checking readiness.
execute unless entity @e[type=minecraft:block_display,tag=rocket_root,limit=1] positioned 86 76 -24 run function zbk_der_eisendrache:rocket/management/apply_map_selection


execute unless entity @e[type=minecraft:block_display,tag=rocket_root,limit=1] run scoreboard players set #rocket_ready global 0
execute unless entity @e[type=minecraft:block_display,tag=rocket_root,limit=1] run tellraw @a [{"text":"[Rocket] ","color":"gold"},{"text":"Rocket is not ready yet. Try Start again in a moment.","color":"yellow"}]
