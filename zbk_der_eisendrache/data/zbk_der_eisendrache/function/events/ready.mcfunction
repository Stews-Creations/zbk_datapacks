# Define feature objectives first; only the accepted provider reconstructs runtime.
scoreboard players set #active zbk.de 0
function zbk_der_eisendrache:on_load
execute if data storage zbk:registry active{id:"zbk_der_eisendrache",version:30000} run function zbk_der_eisendrache:events/activate
