data remove storage zombies:de_bow_binding click
execute store result storage zombies:de_bow_binding click.quest int 1 run scoreboard players get @s de_bow_kind
data modify storage zombies:de_bow_binding click.player set from entity @s interaction.player
data remove entity @s interaction
function zbk_der_eisendrache:quest/bows/binding/interactions/dispatch with storage zombies:de_bow_binding click
