# Close-range right-clicks hit the interaction before the consumable bow can draw.
data remove storage zombies:de_electric_fire fire_clicker
data modify storage zombies:de_electric_fire fire_clicker set from entity @s interaction.player
data remove entity @s interaction
function zbk_der_eisendrache:quest/bows/electric/fires/interactions/dispatch_use with storage zombies:de_electric_fire
