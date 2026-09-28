# Scheduled by game_start_deferred. Submit the saved token/context to Core, then discard it.
# This must run outside the event callback; Core validates whether the resume is still current.
execute if score #active zbk.template matches 1 run tellraw @a[tag=debug] {"text":"[ZBK Template] game/resume: submitting the saved start token.","color":"gray"}
execute if score #active zbk.template matches 1 run function zbk:api/game/resume with storage zbk_template:state start
data remove storage zbk_template:state start
