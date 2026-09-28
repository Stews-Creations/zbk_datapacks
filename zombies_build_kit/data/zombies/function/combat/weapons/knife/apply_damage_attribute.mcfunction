# Apply knife damage by setting base attack damage
# Runs every tick for all players to ensure correct damage
# We subtract 8 because the knife item adds 8 damage on top of base

# Start from the canonical round-scaled knife damage, then apply the permanent Bowie bonus.
scoreboard players operation @s knife.damage = #global knife.damage
execute if score @s bowie_knife matches 1.. run scoreboard players add @s knife.damage 9

# Calculate adjusted damage (target damage - 8 for the knife item).
scoreboard players remove @s knife.damage 8

# Set base attack damage to adjusted value
execute store result storage zombies:temp apply_damage double 1 run scoreboard players get @s knife.damage
function zombies:combat/weapons/knife/apply_damage_macro with storage zombies:temp
