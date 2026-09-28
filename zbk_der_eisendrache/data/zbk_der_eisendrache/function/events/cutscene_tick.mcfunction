# Der Eisendrache map-owned cutscene tick. State 5 remains owned by DE until cleanup.
execute unless score #global cutscene_active matches 5 run return 0
function zbk_der_eisendrache:intro_cutscene/management/tick
