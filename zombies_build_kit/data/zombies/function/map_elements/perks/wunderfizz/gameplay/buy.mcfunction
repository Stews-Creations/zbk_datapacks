# Check if power is on
execute if score #power power matches 0 run tellraw @s [{"text":"[Der Wunderfizz] ","color":"light_purple"},{"text":"Power must be activated first!","color":"red"}]
execute if score #power power matches 0 run return fail

# Check if player has reached 4 perk limit
execute if score @s perk_count matches 4.. run tellraw @s [{"text":"[Der Wunderfizz] ","color":"light_purple"},{"text":"You already have 4 perks!","color":"red"}]
execute if score @s perk_count matches 4.. run return fail

# Check if has enough points
execute if score @s player_points matches ..1499 run tellraw @s [{"text":"[Der Wunderfizz] ","color":"light_purple"},{"text":"Not enough points! Cost: 1500","color":"red"}]
execute if score @s player_points matches ..1499 run return fail

# Check if player already has all available perks
execute if score @s perk_jugg matches 1.. if score @s perk_speed matches 1.. if score @s perk_doubletap matches 1.. if score @s perk_stamina matches 1.. if score @s perk_revive matches 1.. if score @s perk_mule matches 1.. run tellraw @s [{"text":"[Der Wunderfizz] ","color":"light_purple"},{"text":"You already have all available perks!","color":"red"}]
execute if score @s perk_jugg matches 1.. if score @s perk_speed matches 1.. if score @s perk_doubletap matches 1.. if score @s perk_stamina matches 1.. if score @s perk_revive matches 1.. if score @s perk_mule matches 1.. run return fail

# If all checks pass, start the animation cycle
execute if score @s player_points matches 1500.. run function zombies:map_elements/perks/wunderfizz/gameplay/start_cycle
