# Runs as the console interaction entity after a player right-click.
execute if score #active zbk.de matches 1 run playsound zbk_der_eisendrache:tram.tram_lever master @a[distance=..3] ~ ~ ~ 1 1
data remove storage zombies:tram_call_console interaction_player
data modify storage zombies:tram_call_console interaction_player set from entity @s interaction.player
function zbk_der_eisendrache:tram/call_console/interactions/dispatch with storage zombies:tram_call_console
data remove entity @s interaction
