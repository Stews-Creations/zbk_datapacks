# Context: claiming machine at its position. Decrement before testing zero so timeout has no extra tick.

scoreboard players remove @s wunderfizz_timer 1
execute if score @s wunderfizz_timer matches 0 run function zbk:map_elements/perks/wunderfizz/gameplay/timeout
