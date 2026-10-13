# Synchronous scratch data; each wave overwrites its own radius and particle offsets.
execute store result storage zbk:cherry wave.radius double 0.01 run scoreboard players get #cherry_spent stats
scoreboard players operation #cherry_diag stats = #cherry_spent stats
scoreboard players set #cherry_factor stats 71
scoreboard players operation #cherry_diag stats *= #cherry_factor stats
scoreboard players set #cherry_factor stats 100
scoreboard players operation #cherry_diag stats /= #cherry_factor stats
execute store result storage zbk:cherry wave.diagonal double 0.01 run scoreboard players get #cherry_diag stats
function zbk:map_elements/perks/electric_cherry/effects/wave with storage zbk:cherry wave
