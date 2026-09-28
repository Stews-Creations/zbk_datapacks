# Rebuild labels when a chunk loads an older wall marker.
function zombies:map_elements/wall_gun/marker/initialize_prices
schedule function zombies:map_elements/wall_gun/initialize 1t
