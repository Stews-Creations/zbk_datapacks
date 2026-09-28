# Context: enabled location at its position.
# Particles and beam share this lookup; transfer, pending animations, and Fire Sale remain separate.

function mystery_box:effects/box_particle
execute if score #total_locations mystery_box_location_id matches 2.. run function mystery_box:effects/beam
