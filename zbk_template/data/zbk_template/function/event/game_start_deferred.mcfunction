# Core emits this only after accepting this provider's deferral. Save the token-bearing context now.
# The scheduled function resumes later, outside synchronous event dispatch.
execute if score #active zbk.template matches 1 if score #defer_start zbk.template matches 1 run tellraw @a[tag=debug] {"text":"[ZBK Template] game_start_deferred: accepted; resume scheduled in 2 seconds.","color":"gray"}
execute if score #active zbk.template matches 1 if score #defer_start zbk.template matches 1 run data modify storage zbk_template:state start set from storage zbk:events stack[-1].context
execute if score #active zbk.template matches 1 if score #defer_start zbk.template matches 1 run schedule function zbk_template:game/resume 2s replace
