# Per-tick logic for a Thunder Wall launching piglin.
# Run as @s = launching piglin (positioned at @s).

# Decrement timer
scoreboard players remove @s tw_launch_timer 1

# Trailing electric sparks while in flight
particle minecraft:electric_spark ~ ~0.5 ~ 0.2 0.3 0.2 0.3 3 force

# When timer hits 0, finish the launch (kill + attribution)
execute if score @s tw_launch_timer matches 0 run function zombies:combat/weapons/pack_a_punch/elements/thunder_wall/finish_launch
