# Only marked blocks are removed; surrounding architecture is untouched.
particle minecraft:block{block_state:{Name:"minecraft:stone_bricks"}} ~0.5 ~0.5 ~0.5 0.35 0.35 0.35 0.1 18 force
setblock ~ ~ ~ minecraft:air
scoreboard players set @s de_el_broken 1
