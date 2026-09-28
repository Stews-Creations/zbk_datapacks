# === BUY STAMINA UP PERK ===
# Handles purchasing from the machine

# Block purchase if player is downed
execute if entity @s[team=downed] run return fail

# Check if power is on
execute if score #power power matches 0 run tellraw @s [{"text":"[PERK] ","color":"red"},{"text":"Power must be on","color":"gold"}]
execute if score #power power matches 0 run return fail

# Check if player has reached the 4 perk limit
execute if score @s perk_count matches 4.. run tellraw @s [{"text":"[PERK] ","color":"red"},{"text":"Stamina Up: Cannot buy, perk limit reached (4/4)","color":"gold"}]
execute if score @s perk_count matches 4.. run return fail

# If the player already has the perk, show message and cancel
execute if score @s perk_stamina matches 1.. run tellraw @s [{"text":"[PERK] ","color":"red"},{"text":"Already purchased","color":"gold"}]
execute if score @s perk_stamina matches 1.. run return fail

# If the player has fewer than 2000 points, show a red tellraw message and cancel
execute if score @s player_points matches ..1999 run tellraw @s [{"text":"[PERK] ","color":"red"},{"text":"Not enough points","color":"gold"}]
execute if score @s player_points matches ..1999 run return fail

# Deduct points and grant the perk
scoreboard players remove @s player_points 2000
function zombies:map_elements/perks/stamina_up/grant
