# Award points for killing a mob with a gun (raycast)
# Base: 100 points per kill
# No points awarded if player is downed

execute unless entity @s[team=downed] run scoreboard players add @s player_points 100

# Double if double points powerup is active
execute unless entity @s[team=downed] if score global double_points matches 1 run scoreboard players add @s player_points 100
