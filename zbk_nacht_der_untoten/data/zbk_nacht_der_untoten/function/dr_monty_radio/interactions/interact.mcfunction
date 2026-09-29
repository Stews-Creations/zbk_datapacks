execute unless score #active zbk.nacht matches 1 run return 0
# ===================================
# DR MONTY RADIO - INTERACT
# ===================================
# Purpose: Handle player right-clicking the Dr. Monty radio interaction entity
# Called from advancement/interaction_dr_monty_radio.json

# Revoke advancement so it can trigger again
advancement revoke @s only zbk_nacht_der_untoten:interaction_dr_monty_radio


# Check if player is holding build manager stick - leave management to Map Tools
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run return 1

# If holding a gun in offhand, force fire it (interaction intercepted the right-click)
execute if items entity @s weapon.offhand *[custom_data~{gun:true}] run function zbk:combat/weapons/firing/force_fire
