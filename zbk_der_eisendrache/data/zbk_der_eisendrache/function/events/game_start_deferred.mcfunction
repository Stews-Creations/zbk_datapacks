execute unless score #active zbk.de matches 1 run return 0
execute unless data storage zbk:events stack[-1].context{owner:"zbk_der_eisendrache"} run return 0
data modify storage zbk_der_eisendrache:state start set from storage zbk:events stack[-1].context
function zbk_der_eisendrache:intro_cutscene/management/start
