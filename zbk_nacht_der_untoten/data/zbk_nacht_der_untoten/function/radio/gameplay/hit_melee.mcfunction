# ===================================
# DR MONTY RADIO - MELEE HIT
# ===================================
# Purpose: Handle player punching the Dr. Monty radio
# Called as @s = the zbk_nacht_radio_interaction, at @s

# Clear the attack data so it doesn't retrigger
data remove entity @s attack

# Call the hit function
function zbk_nacht_der_untoten:radio/gameplay/hit
