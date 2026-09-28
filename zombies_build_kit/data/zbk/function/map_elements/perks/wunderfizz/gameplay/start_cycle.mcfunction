# Debug message
function zbk:debug/info {f:"FIZZ",m:"Wunderfizz purchased for 1500 points"}

# Deduct points
scoreboard players remove @s player_points 1500

# Find the nearest wunderfizz marker (only active location)
tag @s add wunderfizz_buyer
execute as @e[type=marker,tag=wunderfizz,tag=wunderfizz_active_location,sort=nearest,limit=1] at @s run tag @s add wunderfizz_active

# Tag the active machine as cycling
tag @e[type=marker,tag=wunderfizz_active] add wunderfizz_cycling

# Initialize cycle timer (60 ticks = 3 seconds)
scoreboard players set @e[type=marker,tag=wunderfizz_active] wunderfizz_timer 60

# Initialize random starting perk (0-5)
execute store result score @e[type=marker,tag=wunderfizz_active,limit=1] wunderfizz_perk run random value 0..5

# Play activation sound
execute at @e[type=marker,tag=wunderfizz_active] run playsound zbk:wonderfizz.rand_perk_mach_start master @a ~ ~ ~ 0.5 1

# Start the cycling animation
execute as @e[type=marker,tag=wunderfizz_active] at @s run function zbk:map_elements/perks/wunderfizz/animation/cycle
