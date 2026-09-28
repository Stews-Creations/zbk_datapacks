# Core calls this before reset. Cancel the pending resume and discard its saved token/context.
execute if score #active zbk.template matches 1 run tellraw @a[tag=debug] {"text":"[ZBK Template] before_game_reset: clearing any pending start resume.","color":"gray"}
execute if score #active zbk.template matches 1 run schedule clear zbk_template:game/resume
execute if score #active zbk.template matches 1 run data remove storage zbk_template:state start
