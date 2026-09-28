execute unless score #active zbk.de matches 1 run return 0
execute unless dimension minecraft:overworld run return 0
execute unless score #electric de_el_progress matches 4 run return 0
execute unless entity @e[type=marker,tag=de_eb_marker,distance=..6] run return 0
execute unless score @s id matches 1.. run return 0
execute if entity @s[team=downed] run return 0
execute if entity @s[gamemode=spectator] run return 0
# A deposited weapon belongs to its depositor even if quest binding later changes.
execute if score #phase de_eb_state matches 4 if score @s id = #buyer de_eb_owner run return run function zbk_der_eisendrache:quest/bows/electric/ritual_box/reward/claim
execute unless score @s id = #1 de_bow_owner run return 0
execute if score #phase de_eb_state matches 0 run return run function zbk_der_eisendrache:quest/bows/electric/ritual_box/management/activate
execute if score #phase de_eb_state matches 2 run function zbk_der_eisendrache:quest/bows/electric/ritual_box/interactions/offer
