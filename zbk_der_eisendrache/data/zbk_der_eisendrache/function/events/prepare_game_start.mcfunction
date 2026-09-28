# Block game start while the batched rocket model is still rebuilding.
function zbk_der_eisendrache:rocket/management/ensure_ready
scoreboard players operation #map_ready global = #rocket_ready global
