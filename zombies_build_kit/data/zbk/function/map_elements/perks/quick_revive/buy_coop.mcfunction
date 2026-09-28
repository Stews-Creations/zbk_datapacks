# === BUY QUICK REVIVE PERK - CO-OP MODE ===
# Co-op mode: 1500 points, permanent once bought, power required

# Check if power is on
execute if score #power power matches 0 run tellraw @s [{"text":"[PERK] ","color":"red"},{"text":"Power must be on","color":"gold"}]
execute if score #power power matches 0 run return fail

# Check if player has reached the 4 perk limit
execute if score @s perk_count matches 4.. run tellraw @s [{"text":"[PERK] ","color":"red"},{"text":"Quick Revive: Cannot buy, perk limit reached (4/4)","color":"gold"}]
execute if score @s perk_count matches 4.. run return fail

# Check if already purchased
execute if score @s perk_revive matches 1.. run tellraw @s [{"text":"[PERK] ","color":"red"},{"text":"Already purchased","color":"gold"}]
execute if score @s perk_revive matches 1.. run return fail

# Check if player has enough points (1500)
execute if score @s player_points matches ..1499 run tellraw @s [{"text":"[PERK] ","color":"red"},{"text":"Not enough points","color":"gold"}]
execute if score @s player_points matches ..1499 run return fail

# Deduct points and grant the perk
scoreboard players remove @s player_points 1500
function zbk:map_elements/perks/quick_revive/grant
