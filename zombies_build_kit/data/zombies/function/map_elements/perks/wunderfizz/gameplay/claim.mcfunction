# ===================================
# WUNDERFIZZ - CLAIM PERK EARLY
# ===================================
# Allows player to claim the selected perk during animation
# by right-clicking again (no additional cost)
# ===================================

# Tell player they're claiming (debug only)
execute as @s[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Der Wunderfizz] ","color":"light_purple"},{"text":"Claiming perk...","color":"green"}]

# Grant the random perk immediately
function zombies:map_elements/perks/wunderfizz/gameplay/grant_random

# Increment use counter at active location
execute as @e[type=marker,tag=wunderfizz_active_location] run scoreboard players add @s wunderfizz_uses 1

# Check if max uses reached and trigger location swap
execute as @e[type=marker,tag=wunderfizz_active_location] if score @s wunderfizz_uses >= #wunderfizz_max_uses wunderfizz_uses run function zombies:map_elements/perks/wunderfizz/location_manager/swap_location
