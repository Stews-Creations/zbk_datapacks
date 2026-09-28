# The helper groups particles at one floor without changing their count or cadence.
# Only the caller position changes; no entity identity is required for these effects.

# Presentation only; caller retains executor and sets marker position.
particle flame ~ ~0.1 ~ 0.3 0.05 0.3 0.01 3 force
particle smoke ~ ~0.2 ~ 0.25 0.1 0.25 0.005 1 force
execute if score #tick tick matches 0 run particle large_smoke ~ ~0.3 ~ 0.2 0.1 0.2 0.01 2 force
