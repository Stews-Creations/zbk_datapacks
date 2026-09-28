# Core runs this notification as the killed entity. Use the live event frame for optional kill context.
execute if score #active zbk.template matches 1 if entity @s[type=#minecraft:hostile] run tellraw @a[tag=debug] {"text":"[ZBK Template] enemy_killed: a hostile entity was killed.","color":"gray"}
