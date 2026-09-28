# Recover a cancelled bow exchange after a map change or reconnect.
execute if score @s de_eb_slot matches 1..3 run function zbk_der_eisendrache:quest/bows/electric/ritual_box/reward/recover
# The player inventory manager delegates map-owned status items here.
# Dropped cosmetic items are cleaned once per tick by maps/on_tick.
execute if score #active zbk.de matches 1 run return run function zbk_der_eisendrache:quest/hud/inventory/update
function zbk_der_eisendrache:quest/hud/inventory/clear_all
