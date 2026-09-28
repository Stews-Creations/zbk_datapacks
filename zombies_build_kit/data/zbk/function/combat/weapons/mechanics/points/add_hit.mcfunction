# Award points for hitting a mob with a weapon
# Base: 10 points per hit
# No points awarded if player is downed

execute unless entity @s[team=downed] run scoreboard players add @s player_points 10

# Double if double points powerup is active
execute unless entity @s[team=downed] if score global double_points matches 1 run scoreboard players add @s player_points 10
