# === SHOW SPAWN MARKER PARTICLES ===
# Purpose: Display particles at spawn markers when toggle is enabled
# Dispatches to each marker type.

function zbk:waves/markers/zombie/show_particles
function zbk:waves/markers/dog/show_particles
function zbk:waves/events/extension/markers/show_particles
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
