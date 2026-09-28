# Delete the nearest persistent disco placement within 5 blocks.
execute unless score #active zbk.de matches 1 run return 0

kill @e[type=marker,tag=de_disco_marker,distance=..5,limit=1,sort=nearest]
function zbk_der_eisendrache:quest/disco/initialize
