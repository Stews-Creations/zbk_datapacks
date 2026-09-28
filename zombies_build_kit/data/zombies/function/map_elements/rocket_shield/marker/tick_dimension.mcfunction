execute as @e[distance=0..,type=text_display,tag=rs_part_text] at @s positioned ^ ^-0.5 ^0.60 run function zombies:map_elements/rocket_shield/display/prompt
execute as @e[distance=0..,type=interaction,tag=rs_part_interaction] at @s if data entity @s interaction.player run function zombies:map_elements/rocket_shield/interactions/read
