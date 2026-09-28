# Per-tick logic for a Blast Furnace burning piglin.
# Run as @s = burning piglin (positioned at @s).

# Decrement timer
scoreboard players remove @s bf_burn_timer 1

# Continuous flame visual
particle minecraft:flame ~ ~1 ~ 0.3 0.5 0.3 0.02 4 force

# When timer hits 0, finish the burn (kill + attribution)
execute if score @s bf_burn_timer matches 0 run function zombies:combat/weapons/pack_a_punch/elements/blast_furnace/finish_burn
