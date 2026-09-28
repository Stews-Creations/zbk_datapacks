# The client Main Hand option is not a player NBT/predicate field in Java 26.2.
# Missing preferences use the original gun-left presentation until chosen.
execute if score @s set_gun_side matches 1..2 run function zombies:player/settings/hands/apply
# Discard unsupported trigger values without changing the saved preference.
execute unless score @s set_gun_side matches 0 run scoreboard players set @s set_gun_side 0
