# Round notification: inspect the live context for the round number. Round 10 shows an actionbar example.
execute if score #active zbk.template matches 1 run tellraw @a[tag=debug] [{"text":"[ZBK Template] round_start: round ","color":"gray"},{"nbt":"stack[-1].context.round","storage":"zbk:events","color":"yellow"}]
execute if score #active zbk.template matches 1 if data storage zbk:events stack[-1].context{round:10} run title @a actionbar {"text":"Template example: Round 10","color":"gold"}
