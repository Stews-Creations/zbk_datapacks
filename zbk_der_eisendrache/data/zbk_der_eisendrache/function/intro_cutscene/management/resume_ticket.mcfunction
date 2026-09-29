# Retry readiness only while this exact the base pack request remains pending.
$execute unless data storage zbk:state pending{token:$(token),generation:$(generation),owner:"$(owner)"} run return run data remove storage zbk_der_eisendrache:state start
function zbk:game/start/resume with storage zbk_der_eisendrache:state start
$execute if data storage zbk:state pending{token:$(token),generation:$(generation),owner:"$(owner)"} run return run schedule function zbk_der_eisendrache:intro_cutscene/management/resume_deferred 20t replace
data remove storage zbk_der_eisendrache:state start
