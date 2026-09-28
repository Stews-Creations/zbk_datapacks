# === SHOW SPAWN MARKER PARTICLES ===
# Purpose: Display particles at spawn markers when toggle is enabled
# Dispatches to each marker type.

function zombies:waves/markers/zombie/show_particles
function zombies:waves/markers/dog/show_particles
function zbk:dispatch/extension/waves/markers/show_particles/1
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
