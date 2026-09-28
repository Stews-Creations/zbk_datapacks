# Initialize knife damage system
scoreboard objectives add knife.damage dummy
scoreboard objectives add melee_timer dummy
scoreboard objectives add bowie_knife dummy "Bowie Knife"

# Calculate initial damage
function zombies:combat/weapons/knife/calculate_damage
