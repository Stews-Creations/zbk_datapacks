execute if score #active zbk.template matches 1 if score #defer_start zbk.template matches 1 run data modify storage zbk_template:state start set from storage zbk:events stack[-1].context
execute if score #active zbk.template matches 1 if score #defer_start zbk.template matches 1 run schedule function zbk_template:game/resume 2s replace
