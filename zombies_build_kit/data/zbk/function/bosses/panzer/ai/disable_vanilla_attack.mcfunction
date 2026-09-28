# Prevent the invisible iron golem controller from doing vanilla melee damage.

attribute @s minecraft:attack_damage base set 0
tag @s add panzer_vanilla_attack_disabled
