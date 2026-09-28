# Summon a configured tram marker at the command executor's position.
# Usage: /function zbk_der_eisendrache:tram/spawning/summon_marker {type:"start"}
#        /function zbk_der_eisendrache:tram/spawning/summon_marker {type:"middle"}
#        /function zbk_der_eisendrache:tram/spawning/summon_marker {type:"stop"}
#        /function zbk_der_eisendrache:tram/spawning/summon_marker {type:"reward_spawn"}
execute unless score #active zbk.de matches 1 run return 0
$function zbk_der_eisendrache:tram/marker/$(type)
