scoreboard objectives add zbk.nacht dummy
scoreboard objectives add give_nacht_radio trigger
scoreboard players set #active zbk.nacht 0
function zbk:global/startup/register {id:"zbk_nacht_der_untoten",version:30000}
