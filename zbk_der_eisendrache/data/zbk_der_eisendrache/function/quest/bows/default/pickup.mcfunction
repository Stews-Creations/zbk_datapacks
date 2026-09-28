# Run as player who right-clicked the bow

# This directly callable pickup remains Der Eisendrache-only.
execute unless score #active zbk.de matches 1 run return 0

# Revoke advancement for re-use
advancement revoke @s only zbk_der_eisendrache:interaction_dragon_bow

# Check if player already has a bow in any slot (gun_id 11)
execute if score @s gun_1 matches 11 run return run tellraw @s {"text":"You already have a Bow!","color":"red"}
execute if score @s gun_2 matches 11 run return run tellraw @s {"text":"You already have a Bow!","color":"red"}
execute if score @s gun_3 matches 11 run return run tellraw @s {"text":"You already have a Bow!","color":"red"}

# Play pickup sound
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1

# Give bow using weapon system
function zbk_der_eisendrache:combat/weapons/guns/bow/give/main

tellraw @s[tag=debug] [{"text":"You obtained the ","color":"white"},{"text":"Bow","color":"gold","bold":true},{"text":"!","color":"white"}]
