data modify storage zbk:perk_machines click.player set from entity @s interaction.player
execute store result storage zbk:perk_machines click.id int 1 run scoreboard players get @s pm_v2_id
data remove entity @s interaction
function zbk:map_elements/perks/machines/interaction/dispatch with storage zbk:perk_machines click
