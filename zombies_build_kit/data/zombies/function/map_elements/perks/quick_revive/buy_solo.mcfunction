# === BUY QUICK REVIVE PERK - SOLO MODE ===
# Solo mode: 500 points, max 3 purchases, no power required

# Check if player has reached the 4 perk limit
execute if score @s perk_count matches 4.. run tellraw @s [{"text":"[PERK] ","color":"red"},{"text":"Quick Revive: Cannot buy, perk limit reached (4/4)","color":"gold"}]
execute if score @s perk_count matches 4.. run return fail

# Check if already purchased (currently active)
execute if score @s perk_revive matches 1.. run tellraw @s [{"text":"[PERK] ","color":"red"},{"text":"Already purchased","color":"gold"}]
execute if score @s perk_revive matches 1.. run return fail

# Check if player has reached the 3 purchase limit
execute if score @s revive_buys matches 3.. run tellraw @s [{"text":"[PERK] ","color":"red"},{"text":"Quick Revive: Out of purchases (3/3)","color":"gold"}]
execute if score @s revive_buys matches 3.. run return fail

# Check if player has enough points (500)
execute if score @s player_points matches ..499 run tellraw @s [{"text":"[PERK] ","color":"red"},{"text":"Not enough points","color":"gold"}]
execute if score @s player_points matches ..499 run return fail

# Deduct points, track purchase count, and grant the perk
scoreboard players remove @s player_points 500
scoreboard players add @s revive_buys 1
function zombies:map_elements/perks/quick_revive/grant
