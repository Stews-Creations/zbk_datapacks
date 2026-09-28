# Apply Blast Furnace burn to a single AoE victim.
# Run as @s = victim piglin. Requires #shooter_id stats.
# Tags victim and starts a 20-tick burn timer; finish_burn handles death + attribution.

# Skip if already burning (don't reset timer if hit by overlapping blasts)
execute if entity @s[tag=bf_burning] run return 0
execute if entity @s[tag=immune_elements] run return 0

# Visual fire (1.5 seconds)
data modify entity @s Fire set value 30s

# Tag + timer + remember shooter for kill attribution
tag @s add bf_burning
scoreboard players set @s bf_burn_timer 30
scoreboard players operation @s bf_shooter_id = #shooter_id stats

# Initial flame burst
particle minecraft:flame ~ ~1 ~ 0.3 0.5 0.3 0.05 12 force

# Hit points to shooter (full kill points awarded later in finish_burn)
execute as @a[team=!downed] if score @s id = #shooter_id stats run scoreboard players add @s player_points 10
execute if score global double_points matches 1 as @a[team=!downed] if score @s id = #shooter_id stats run scoreboard players add @s player_points 10
