# Der Eisendrache map-owned cutscene cleanup. State 5 remains owned by DE until cleanup.
execute if score #global cutscene_active matches 5 run return run function zbk_der_eisendrache:intro_cutscene/management/stop
execute if score #de_intro_on zbk_video matches 1 run function zbk_der_eisendrache:intro_cutscene/management/stop
