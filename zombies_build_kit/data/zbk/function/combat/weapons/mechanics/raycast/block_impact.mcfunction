# Called at the actual solid-block sample after range/loaded checks.
# A block inside a fire interaction is still a valid quest hit. Resolve it before
# explosion effects at both midpoint and endpoint wall samples.
function zbk:dispatch/extension/combat/weapons/mechanics/raycast/block_impact/1
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

# Explosive ground hit - damage first, then consider surviving adults for crawlers
execute if score #is_explosive stats matches 1 unless score #gun_id stats matches 20..46 run function zbk:combat/weapons/effects/explosive/ground_explosion
execute if score #is_explosive stats matches 1 if score #gun_id stats matches 20..46 run function zbk:combat/weapons/guns/bo3/combat/explosion

function zbk:dispatch/extension/combat/weapons/mechanics/raycast/block_impact/2
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

# A charged electric shot creates one storm on an actual block impact.
function zbk:dispatch/extension/combat/weapons/mechanics/raycast/block_impact/3
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

# A quick shot that has not hit an enemy leaves its orb at the solid block.
function zbk:dispatch/extension/combat/weapons/mechanics/raycast/block_impact/4
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

function zbk:dispatch/extension/combat/weapons/mechanics/raycast/block_impact/5
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

# Ray gun explosion effects (gun_id 7) - smaller, no sound
execute if score #gun_id stats matches 7 run particle minecraft:explosion ~ ~ ~ 0.5 0.5 0.5 0.05 2 force

# Show bullet holes if player missed (non-explosive weapons)
execute unless score #is_explosive stats matches 1 run function zbk:combat/weapons/effects/particles/bullet_hole
