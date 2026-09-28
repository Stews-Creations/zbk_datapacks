# Rebuild labels when a chunk loads an older wall marker.
function zbk:map_elements/wall_gun/marker/initialize_prices
schedule function zbk:map_elements/wall_gun/initialize 1t
