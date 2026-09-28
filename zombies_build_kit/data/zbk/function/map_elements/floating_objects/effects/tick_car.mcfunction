# Hover down and up (reversed from truck).
execute if score #tick tick matches 0..49 run tp @s ~ ~-0.01 ~
execute if score #tick tick matches 50..99 run tp @s ~ ~0.01 ~

# Sway slightly right/left (reversed from truck)
execute if score #tick tick matches 0..24 run tp @s ~-0.01 ~ ~
execute if score #tick tick matches 25..49 run tp @s ~0.01 ~ ~
execute if score #tick tick matches 50..74 run tp @s ~-0.01 ~ ~
execute if score #tick tick matches 75..99 run tp @s ~0.01 ~ ~
