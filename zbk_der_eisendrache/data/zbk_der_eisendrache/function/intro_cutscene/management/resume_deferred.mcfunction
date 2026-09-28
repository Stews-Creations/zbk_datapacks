# Scheduled entry points cannot require macro arguments.
execute unless score #active zbk.de matches 1 run return 0
execute unless data storage zbk_der_eisendrache:state start{owner:"zbk_der_eisendrache"} run return 0
function zbk_der_eisendrache:intro_cutscene/management/resume_ticket with storage zbk_der_eisendrache:state start
