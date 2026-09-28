# Reset notification: recreate disposable displays from persistent markers after Core resets the game.
execute if score #active zbk.template matches 1 run tellraw @a[tag=debug] {"text":"[ZBK Template] game_reset: rebuilding sample displays.","color":"gray"}
execute if score #active zbk.template matches 1 run function zbk_template:initialize
