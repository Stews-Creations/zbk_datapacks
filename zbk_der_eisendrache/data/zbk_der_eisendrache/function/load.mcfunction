# Reset local activation before Core registration on every reload.
scoreboard objectives add zbk.de dummy
scoreboard players set #active zbk.de 0
schedule function zbk_der_eisendrache:events/dependency_check 2t replace
function zbk_der_eisendrache:intro_cutscene/management/cancel_pending
