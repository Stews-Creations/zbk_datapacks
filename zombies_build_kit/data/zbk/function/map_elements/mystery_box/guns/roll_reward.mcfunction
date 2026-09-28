# Final reward roll: first rarity, then reward within that rarity.
# Listed weights are normalized over 995 points:
# Common 60, Uncommon 22, Rare 10, Epic 6, Legendary 1.5.

execute store result score #rarity_roll temp run random value 1..995

execute if score #rarity_roll temp matches 1..600 run return run function zbk:map_elements/mystery_box/guns/roll_rarity/common
execute if score #rarity_roll temp matches 601..820 run return run function zbk:map_elements/mystery_box/guns/roll_rarity/uncommon
execute if score #rarity_roll temp matches 821..920 run return run function zbk:map_elements/mystery_box/guns/roll_rarity/rare
execute if score #rarity_roll temp matches 921..980 run return run function zbk:map_elements/mystery_box/guns/roll_rarity/epic
execute if score #rarity_roll temp matches 981..995 run return run function zbk:map_elements/mystery_box/guns/roll_rarity/legendary
