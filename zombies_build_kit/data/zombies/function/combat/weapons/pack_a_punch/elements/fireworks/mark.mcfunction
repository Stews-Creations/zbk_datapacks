# Mark a single Fireworks AoE victim for delayed kill.
# Run as @s = victim piglin. Requires #shooter_id stats.

# Skip if already marked
execute if entity @s[tag=fw_marked] run return 0
execute if entity @s[tag=immune_elements] run return 0

# Tag + timer + remember shooter for kill attribution
tag @s add fw_marked
scoreboard players set @s fw_kill_timer 30
scoreboard players operation @s fw_shooter_id = #shooter_id stats

# Initial sparkle accent
particle minecraft:firework ~ ~1 ~ 0.3 0.5 0.3 0.05 8 force

# Hit points to shooter (full half-kill points awarded later in finish)
execute as @a[team=!downed] if score @s id = #shooter_id stats run scoreboard players add @s player_points 10
execute if score global double_points matches 1 as @a[team=!downed] if score @s id = #shooter_id stats run scoreboard players add @s player_points 10
