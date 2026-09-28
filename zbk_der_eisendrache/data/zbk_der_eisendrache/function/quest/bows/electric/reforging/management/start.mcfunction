execute unless score #active zbk.de matches 1 run return 0
execute unless score #electric de_el_progress matches 3 run return 0
execute unless score #sequence de_er_state matches 0 run return 0
scoreboard players set #sequence de_er_state 1
scoreboard players set @s de_er_state 1
scoreboard players set #time de_er_tick 0
kill @e[type=interaction,tag=de_er_interaction]
kill @e[type=text_display,tag=de_er_label]
tag @e[type=item_display,tag=de_el_vane_head] remove de_el_vane_spinning
