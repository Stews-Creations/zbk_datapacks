# Validate current support, since wall platforms can disappear after vanilla updates OnGround.
execute if predicate zbk_der_eisendrache:de_el_panel_grounded if function zbk_der_eisendrache:quest/bows/electric/wall_panels/validation/ground_contact run return run function zbk_der_eisendrache:quest/bows/electric/wall_panels/route/reset
# These gates pause collection; they do not erase an airborne attempt.
execute unless score #room de_ag_state matches 1 run return 0
execute unless entity @s[tag=de_ag_inside,tag=!de_ag_suppressed,team=!downed,gamemode=!spectator] run return 0
tag @s add de_el_panel_runner
