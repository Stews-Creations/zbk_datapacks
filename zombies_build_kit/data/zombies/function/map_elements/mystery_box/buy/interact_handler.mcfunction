# Internal handler - @s is mystery_box_location marker
# Routes interaction to appropriate action based on box state

# Priority 1: Claim gun if available
execute if score @s mystery_box_can_claim matches 1 run return run function zombies:map_elements/mystery_box/buy/claim_gun_validated

# Priority 2: Buy if ready and (active or fire sale)
execute if score @s mystery_box_ready matches 1 if score @s mystery_box_active matches 1 run return run function zombies:map_elements/mystery_box/animation/triggers/buy_validated
execute if score @s mystery_box_ready matches 1 if score global fire_sale matches 1 run return run function zombies:map_elements/mystery_box/animation/triggers/buy_validated

# Priority 3: Nothing to do (box not ready or not active)
# Box is either not active, not ready, or already in use
