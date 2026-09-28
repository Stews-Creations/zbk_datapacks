# Reject stale pickups immediately, even before the next maintenance pass.
execute unless score @s rs_epoch = #run rs_epoch run return run kill @s
data modify storage zbk:shield_parts click.player set from entity @s interaction.player
execute store result storage zbk:shield_parts click.id int 1 run scoreboard players get @s rs_candidate
data remove entity @s interaction
execute if entity @s[tag=rs_plate_runtime] run data modify storage zbk:shield_parts click.part set value "plate"
execute if entity @s[tag=rs_mechanism_runtime] run data modify storage zbk:shield_parts click.part set value "mechanism"
execute if entity @s[tag=rs_rocket_runtime] run data modify storage zbk:shield_parts click.part set value "rocket"
function zbk:map_elements/rocket_shield/interactions/dispatch with storage zbk:shield_parts click
