# Called as/at a surviving marker after a nearby machine releases its cells.
execute if entity @s[tag=wunderfizz] positioned ~ ~-2 ~ run function zbk:map_elements/perks/machines/collision/place
execute unless entity @s[tag=wunderfizz] run function zbk:map_elements/perks/machines/collision/place
