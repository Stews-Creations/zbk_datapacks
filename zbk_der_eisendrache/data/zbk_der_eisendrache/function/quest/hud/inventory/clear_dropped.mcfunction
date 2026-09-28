# Kill only dropped status indicators; normal paper and displaced items are untouched.
execute as @e[type=item] if items entity @s contents minecraft:paper[custom_data~{de_quest_ui:1b}] run kill @s
execute as @e[type=item] if items entity @s contents *[custom_data~{de_board_ui:1b}] run kill @s
