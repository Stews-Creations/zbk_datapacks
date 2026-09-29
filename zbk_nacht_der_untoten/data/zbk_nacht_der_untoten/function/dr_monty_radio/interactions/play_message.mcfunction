execute unless score #active zbk.nacht matches 1 run return 0
# ===================================
# DR MONTY RADIO - HIT
# ===================================
# Purpose: Play the message when a player punches or knifes the Dr. Monty radio
# Called from interactions/hit_melee
# Only plays once per game (easter egg)


# Check if already played this game
execute if score #zbk_nacht_radio_played zbk.nacht matches 1.. run return 0

# Mark as played
scoreboard players set #zbk_nacht_radio_played zbk.nacht 1

# Play the Dr. Monty radio audio
playsound zbk_nacht_der_untoten:nacht_der_untoten.dr_monty_radio voice @a ~ ~ ~ 1 1
