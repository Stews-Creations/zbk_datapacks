# ===== DISCO ON TICK =====
# Manages disco effects timer and visual effects
# Called from maps/der_eisendrache/quest/on_tick.mcfunction every tick

# ===== DISCO BALL ROTATION =====
# Rotate any active disco balls
function zbk_der_eisendrache:quest/disco/effects/rotate

# ===== INTERACTION TRACKING =====
# Update interaction position to follow rotating disco ball
function zbk_der_eisendrache:quest/disco/detection/update_position

# ===== PLAYER TRIGGER =====
# Enable trigger for all players
scoreboard players enable @a disco_start

# Check if any player triggered activation
execute as @a[scores={disco_start=1..}] run function zbk_der_eisendrache:quest/disco/activate

# Reset only for players who used it
scoreboard players reset @a[scores={disco_start=1..}] disco_start

# ===== VISUAL EFFECTS =====
# Only run effects if disco is active (before decrementing timer)
execute if score #disco disco_active matches 1 run function zbk_der_eisendrache:quest/disco/effects/lights
execute if score #disco disco_active matches 1 run function zbk_der_eisendrache:quest/disco/effects/floor
execute if score #disco disco_active matches 1 run function zbk_der_eisendrache:quest/disco/effects/particles

# ===== TIMER MANAGEMENT =====
# Run cleanup when timer reaches 1 (last tick)
execute if score #disco disco_timer matches 1 run function zbk_der_eisendrache:quest/disco/cleanup

# Decrement timer if active (after running effects)
execute if score #disco disco_timer matches 1.. run scoreboard players remove #disco disco_timer 1
