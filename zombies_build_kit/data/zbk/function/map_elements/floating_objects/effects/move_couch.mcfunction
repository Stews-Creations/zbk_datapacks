# Hover and sway all floating couches.
execute if score #tick tick matches 0..49 run execute as @e[type=block_display,tag=floating_couch] at @s run tp @s ~ ~-0.01 ~
execute if score #tick tick matches 50..99 run execute as @e[type=block_display,tag=floating_couch] at @s run tp @s ~ ~0.01 ~

# Sway slightly right/left
execute if score #tick tick matches 0..24 run execute as @e[type=block_display,tag=floating_couch] at @s run tp @s ~-0.01 ~ ~
execute if score #tick tick matches 25..49 run execute as @e[type=block_display,tag=floating_couch] at @s run tp @s ~0.01 ~ ~
execute if score #tick tick matches 50..74 run execute as @e[type=block_display,tag=floating_couch] at @s run tp @s ~-0.01 ~ ~
execute if score #tick tick matches 75..99 run execute as @e[type=block_display,tag=floating_couch] at @s run tp @s ~0.01 ~ ~
