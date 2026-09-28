# ===================================
# WUNDERFIZZ - INTERACTION HANDLER
# ===================================
# Triggered when player right-clicks wunderfizz interaction entity
# Called directly from advancement/interaction_wunderfizz.json
# ===================================

# Revoke advancement so it can trigger again
advancement revoke @s only zbk:interaction_wunderfizz

# Block interaction if player is downed
execute if entity @s[team=downed] run return fail

# Check if player is holding build manager stick - open config dialog instead
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] at @s run tag @e[type=marker,tag=wunderfizz,distance=..5,limit=1,sort=nearest] add open_dialog
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run function zbk:build_kit/management/wunderfizz/open_dialog
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run return 1

# Check if nearest wunderfizz is in claim phase, cycling, or idle
# If in claim phase and player is the buyer, allow claiming
# Otherwise if idle, execute buy function

# Try to claim if in claiming phase and player is buyer (only at active location)
execute at @s if entity @e[type=marker,tag=wunderfizz,tag=wunderfizz_active_location,tag=wunderfizz_claiming,distance=..5,limit=1] if entity @s[tag=wunderfizz_buyer] run tag @s add wunderfizz_just_claimed
execute at @s if entity @s[tag=wunderfizz_just_claimed] run function zbk:map_elements/perks/wunderfizz/gameplay/claim

# Try to buy if not cycling and not claiming (machine is idle) and player didn't just claim (only at active location)
execute at @s unless entity @s[tag=wunderfizz_just_claimed] unless entity @e[type=marker,tag=wunderfizz,tag=wunderfizz_cycling,distance=..5,limit=1] unless entity @e[type=marker,tag=wunderfizz,tag=wunderfizz_claiming,distance=..5,limit=1] if entity @e[type=marker,tag=wunderfizz,tag=wunderfizz_active_location,distance=..5,limit=1] run function zbk:map_elements/perks/wunderfizz/gameplay/buy

# Remove claim tag
tag @s remove wunderfizz_just_claimed
