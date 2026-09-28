# Reconcile only inactive quest presentation from newly loaded chunks.
execute unless score #active zbk.de matches 1 run return 0
execute unless score #electric de_el_progress matches 3 run function zbk_der_eisendrache:quest/bows/electric/reforging/management/inactive
execute unless score #electric de_el_progress matches 4 run function zbk_der_eisendrache:quest/bows/electric/ritual_box/management/clear_runtime
function zbk_der_eisendrache:quest/bows/binding/display/maintenance
