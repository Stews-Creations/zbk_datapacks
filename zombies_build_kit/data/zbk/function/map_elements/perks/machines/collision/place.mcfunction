# A two-block solid core prevents walking through the cabinet.
# Reload repairs missing barriers without overwriting builder replacement blocks.
execute if block ~ ~ ~ air run setblock ~ ~ ~ barrier
execute if block ~ ~1 ~ air run setblock ~ ~1 ~ barrier
function zbk:map_elements/perks/machines/collision/place_sides
