# === HANDLE SELF DAMAGE FROM GRENADE ===
# Executed as the player who threw the grenade
# Uses existing health scoreboard (auto-tracks player health in HALF-HEARTS, so 20 = 10 hearts)

# Set damage target based on current health (in half-hearts)
# If health > 10 half-hearts: target = 10 half-hearts (5 hearts)
# If health ≤ 10 half-hearts: target = 6 half-hearts (3 hearts)
execute if score @s health matches 11.. run scoreboard players set #damage_target damage_calc 10
execute if score @s health matches ..10 run scoreboard players set #damage_target damage_calc 6

# Calculate damage amount in half-hearts: current_health - target
scoreboard players operation #damage_amount damage_calc = @s health
scoreboard players operation #damage_amount damage_calc -= #damage_target damage_calc

# Convert half-hearts to full hearts for damage command (divide by 2)
scoreboard players set #two damage_calc 2
scoreboard players operation #damage_amount damage_calc /= #two damage_calc

# Apply damage if positive (only if current health > target)
execute if score #damage_amount damage_calc matches 1.. store result storage minecraft:temp damage int 1 run scoreboard players get #damage_amount damage_calc
execute if score #damage_amount damage_calc matches 1.. run function zbk:combat/weapons/grenade/damage/apply_damage_macro with storage minecraft:temp

# Clear temporary scores
scoreboard players reset #damage_target damage_calc
scoreboard players reset #damage_amount damage_calc
scoreboard players reset #two damage_calc
