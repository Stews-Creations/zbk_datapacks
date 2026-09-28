# ===== DISCO FLOOR EFFECT =====
# Creates pulsing colored effects on the floor
# Called every tick when disco is active
# Executes at disco ball position (floor is ~-8 below the ball)

# Floor particle bursts - cycling colors (12 block radius) - stops 1 second before end
execute if score #disco disco_timer matches 20..24 as @e[type=item_display,tag=disco_ball,limit=1] at @s run particle dust{color:[1.0,0.0,0.0],scale:1.5} ~ ~-9.9 ~ 12 0 12 0 200 force
execute if score #disco disco_timer matches 25..29 as @e[type=item_display,tag=disco_ball,limit=1] at @s run particle dust{color:[0.0,1.0,0.0],scale:1.5} ~ ~-9.9 ~ 12 0 12 0 200 force
execute if score #disco disco_timer matches 30..34 as @e[type=item_display,tag=disco_ball,limit=1] at @s run particle dust{color:[0.0,0.5,1.0],scale:1.5} ~ ~-9.9 ~ 12 0 12 0 200 force
execute if score #disco disco_timer matches 35..39 as @e[type=item_display,tag=disco_ball,limit=1] at @s run particle dust{color:[1.0,1.0,0.0],scale:1.5} ~ ~-9.9 ~ 12 0 12 0 200 force

# Glowstone dust particles for sparkle effect (12 block radius) - stops 1 second before end
execute if score #disco disco_timer matches 21.. as @e[type=item_display,tag=disco_ball,limit=1] at @s run particle glow ~ ~-5 ~ 12 3 12 0 60 force

# Electric effect at corners on floor level (12 blocks from center) - stops 1 second before end
execute if score #disco disco_timer matches 20..22 as @e[type=item_display,tag=disco_ball,limit=1] at @s run particle electric_spark ~12 ~-9 ~12 0.5 1 0.5 0 10 force
execute if score #disco disco_timer matches 23..25 as @e[type=item_display,tag=disco_ball,limit=1] at @s run particle electric_spark ~-12 ~-9 ~12 0.5 1 0.5 0 10 force
execute if score #disco disco_timer matches 26..28 as @e[type=item_display,tag=disco_ball,limit=1] at @s run particle electric_spark ~12 ~-9 ~-12 0.5 1 0.5 0 10 force
execute if score #disco disco_timer matches 29..31 as @e[type=item_display,tag=disco_ball,limit=1] at @s run particle electric_spark ~-12 ~-9 ~-12 0.5 1 0.5 0 10 force
