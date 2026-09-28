# === BUY QUICK REVIVE PERK ===
# Routes to the appropriate buy function based on game mode
# Solo mode: 500 points, max 3 purchases, no power required
# Co-op mode: 1500 points, permanent once bought, power required

# Block purchase if player is downed
execute if entity @s[team=downed] run return fail

# Route to solo buy function
execute if score #game_mode game_mode matches 1 run function zombies:map_elements/perks/quick_revive/buy_solo

# Route to co-op buy function
execute if score #game_mode game_mode matches 2 run function zombies:map_elements/perks/quick_revive/buy_coop
