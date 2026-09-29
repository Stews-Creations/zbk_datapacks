# Only remove barrier cells reserved at placement.
execute if block ~ ~ ~ barrier run setblock ~ ~ ~ air
execute if block ~ ~1 ~ barrier run setblock ~ ~1 ~ air
function zbk:map_elements/perks/machines/collision/clear_sides
