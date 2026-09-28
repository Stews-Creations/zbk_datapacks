# Apply Thunder Wall launch to a single AoE victim.
# Run as @s = victim piglin. Requires #shooter_id stats.

# Skip if already launching (don't restack from overlapping blasts)
execute if entity @s[tag=tw_launching] run return 0
execute if entity @s[tag=immune_elements] run return 0

# Levitation: 1 second, amp 1 — ~1.8 blocks of vertical lift over the launch
effect give @s minecraft:levitation 1 1 true

# Tag + timer + remember shooter for kill attribution
tag @s add tw_launching
scoreboard players set @s tw_launch_timer 16
scoreboard players operation @s tw_shooter_id = #shooter_id stats

# Per-victim spark burst
particle minecraft:electric_spark ~ ~1 ~ 0.3 0.5 0.3 0.5 12 force

# Hit points to shooter (full half-kill points awarded later in finish_launch)
execute as @a[team=!downed] if score @s id = #shooter_id stats run scoreboard players add @s player_points 10
execute if score global double_points matches 1 as @a[team=!downed] if score @s id = #shooter_id stats run scoreboard players add @s player_points 10
