# This function handles the cycling animation
# Called every tick while wunderfizz_cycling tag is active

# Decrement timer
scoreboard players remove @s wunderfizz_timer 1

# Every 4 ticks, change the displayed perk (15 times per second for smooth cycling)
execute if score @s wunderfizz_timer matches 1..60 if score @s wunderfizz_timer matches 56 run function zbk:map_elements/perks/wunderfizz/animation/show_perk
execute if score @s wunderfizz_timer matches 1..60 if score @s wunderfizz_timer matches 52 run function zbk:map_elements/perks/wunderfizz/animation/show_perk
execute if score @s wunderfizz_timer matches 1..60 if score @s wunderfizz_timer matches 48 run function zbk:map_elements/perks/wunderfizz/animation/show_perk
execute if score @s wunderfizz_timer matches 1..60 if score @s wunderfizz_timer matches 44 run function zbk:map_elements/perks/wunderfizz/animation/show_perk
execute if score @s wunderfizz_timer matches 1..60 if score @s wunderfizz_timer matches 40 run function zbk:map_elements/perks/wunderfizz/animation/show_perk
execute if score @s wunderfizz_timer matches 1..60 if score @s wunderfizz_timer matches 36 run function zbk:map_elements/perks/wunderfizz/animation/show_perk
execute if score @s wunderfizz_timer matches 1..60 if score @s wunderfizz_timer matches 32 run function zbk:map_elements/perks/wunderfizz/animation/show_perk
execute if score @s wunderfizz_timer matches 1..60 if score @s wunderfizz_timer matches 28 run function zbk:map_elements/perks/wunderfizz/animation/show_perk
execute if score @s wunderfizz_timer matches 1..60 if score @s wunderfizz_timer matches 24 run function zbk:map_elements/perks/wunderfizz/animation/show_perk
execute if score @s wunderfizz_timer matches 1..60 if score @s wunderfizz_timer matches 20 run function zbk:map_elements/perks/wunderfizz/animation/show_perk
execute if score @s wunderfizz_timer matches 1..60 if score @s wunderfizz_timer matches 16 run function zbk:map_elements/perks/wunderfizz/animation/show_perk
execute if score @s wunderfizz_timer matches 1..60 if score @s wunderfizz_timer matches 12 run function zbk:map_elements/perks/wunderfizz/animation/show_perk
execute if score @s wunderfizz_timer matches 1..60 if score @s wunderfizz_timer matches 8 run function zbk:map_elements/perks/wunderfizz/animation/show_perk
execute if score @s wunderfizz_timer matches 1..60 if score @s wunderfizz_timer matches 4 run function zbk:map_elements/perks/wunderfizz/animation/show_perk

# Play tick sounds during cycle
execute if score @s wunderfizz_timer matches 1..60 if score @s wunderfizz_timer matches 56 run playsound zbk:wonderfizz.rand_perk_mach_loop master @a ~ ~ ~ 0.5 1
execute if score @s wunderfizz_timer matches 1..60 if score @s wunderfizz_timer matches 40 run playsound zbk:wonderfizz.rand_perk_mach_loop master @a ~ ~ ~ 0.5 1
execute if score @s wunderfizz_timer matches 1..60 if score @s wunderfizz_timer matches 30 run playsound zbk:wonderfizz.rand_perk_mach_loop master @a ~ ~ ~ 0.5 1

execute if score @s wunderfizz_timer matches 1..60 if score @s wunderfizz_timer matches 56 run playsound minecraft:block.note_block.hat master @a ~ ~ ~ 0.5 1.5
execute if score @s wunderfizz_timer matches 1..60 if score @s wunderfizz_timer matches 52 run playsound minecraft:block.note_block.hat master @a ~ ~ ~ 0.5 1.5
execute if score @s wunderfizz_timer matches 1..60 if score @s wunderfizz_timer matches 48 run playsound minecraft:block.note_block.hat master @a ~ ~ ~ 0.5 1.5
execute if score @s wunderfizz_timer matches 1..60 if score @s wunderfizz_timer matches 44 run playsound minecraft:block.note_block.hat master @a ~ ~ ~ 0.5 1.5
execute if score @s wunderfizz_timer matches 1..60 if score @s wunderfizz_timer matches 40 run playsound minecraft:block.note_block.hat master @a ~ ~ ~ 0.5 1.5
execute if score @s wunderfizz_timer matches 1..60 if score @s wunderfizz_timer matches 36 run playsound minecraft:block.note_block.hat master @a ~ ~ ~ 0.5 1.5
execute if score @s wunderfizz_timer matches 1..60 if score @s wunderfizz_timer matches 32 run playsound minecraft:block.note_block.hat master @a ~ ~ ~ 0.5 1.5
execute if score @s wunderfizz_timer matches 1..60 if score @s wunderfizz_timer matches 28 run playsound minecraft:block.note_block.hat master @a ~ ~ ~ 0.5 1.5
execute if score @s wunderfizz_timer matches 1..60 if score @s wunderfizz_timer matches 24 run playsound minecraft:block.note_block.hat master @a ~ ~ ~ 0.5 1.5
execute if score @s wunderfizz_timer matches 1..60 if score @s wunderfizz_timer matches 20 run playsound minecraft:block.note_block.hat master @a ~ ~ ~ 0.5 1.5
execute if score @s wunderfizz_timer matches 1..60 if score @s wunderfizz_timer matches 16 run playsound minecraft:block.note_block.hat master @a ~ ~ ~ 0.5 1.5
execute if score @s wunderfizz_timer matches 1..60 if score @s wunderfizz_timer matches 12 run playsound minecraft:block.note_block.hat master @a ~ ~ ~ 0.5 1.5
execute if score @s wunderfizz_timer matches 1..60 if score @s wunderfizz_timer matches 8 run playsound minecraft:block.note_block.hat master @a ~ ~ ~ 0.5 1.5
execute if score @s wunderfizz_timer matches 1..60 if score @s wunderfizz_timer matches 4 run playsound minecraft:block.note_block.hat master @a ~ ~ ~ 0.5 1.5


# When spinning timer reaches 0, stop cycling and enter claim phase
execute if score @s wunderfizz_timer matches 0 run tag @s remove wunderfizz_cycling
execute if score @s wunderfizz_timer matches 0 run tag @s add wunderfizz_claiming
execute if score @s wunderfizz_timer matches 0 run function zbk:map_elements/perks/wunderfizz/animation/show_perk_name
execute if score @s wunderfizz_timer matches 0 run playsound zbk:wonderfizz.rand_perk_mach_stop master @a ~ ~ ~ 0.5 1
execute if score @s wunderfizz_timer matches 0 run scoreboard players set @s wunderfizz_timer 100
