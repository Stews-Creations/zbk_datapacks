# ===== DISCO LIGHTS EFFECT =====
# Creates rotating colored light beams across the disco area
# Called every tick when disco is active
# Executes at disco ball position (ceiling mounted, floor is ~-10 below)

# ===== BURST EFFECTS AT SONG BEATS =====
# Burst at 0.25s in - Red - lasts 3 ticks (1034, 1035, 1036)
execute if score #disco disco_timer matches 1034..1036 as @e[type=item_display,tag=disco_ball,limit=1] at @s run particle dust{color:[1.0,0.0,0.0],scale:3} ~ ~-5 ~ 13 10 13 0 800 force

# Burst at 10.25s in - Blue - lasts 3 ticks (834, 835, 836)
execute if score #disco disco_timer matches 834..836 as @e[type=item_display,tag=disco_ball,limit=1] at @s run particle dust{color:[0.0,0.5,1.0],scale:3} ~ ~-5 ~ 13 10 13 0 800 force

# Burst at 18.25s in - Green - lasts 3 ticks (674, 675, 676)
execute if score #disco disco_timer matches 674..676 as @e[type=item_display,tag=disco_ball,limit=1] at @s run particle dust{color:[0.0,1.0,0.0],scale:3} ~ ~-5 ~ 13 10 13 0 800 force

# Burst at 35.25s in - Purple - lasts 3 ticks (334, 335, 336)
execute if score #disco disco_timer matches 334..336 as @e[type=item_display,tag=disco_ball,limit=1] at @s run particle dust{color:[0.8,0.0,1.0],scale:3} ~ ~-5 ~ 13 10 13 0 800 force

# ===== ROTATING SPOTLIGHT BEAMS =====
# Rotating spotlight beams from ball to floor - Red (10.4 seconds)
execute if score #disco disco_timer matches 840..1040 as @e[type=item_display,tag=disco_ball,limit=1] at @s run particle dust{color:[1.0,0.0,0.0],scale:2} ~ ~-5 ~ 1.5 1.25 1.5 0 33 force

# Rotating spotlight beams from ball to floor - Blue (10 seconds)
execute if score #disco disco_timer matches 640..839 as @e[type=item_display,tag=disco_ball,limit=1] at @s run particle dust{color:[0.0,0.5,1.0],scale:2} ~ ~-5 ~ 1.5 1.25 1.5 0 33 force

# Rotating spotlight beams from ball to floor - Green (10 seconds)
execute if score #disco disco_timer matches 440..639 as @e[type=item_display,tag=disco_ball,limit=1] at @s run particle dust{color:[0.0,1.0,0.0],scale:2} ~ ~-5 ~ 1.5 1.25 1.5 0 33 force

# Rotating spotlight beams from ball to floor - Purple (10 seconds)
execute if score #disco disco_timer matches 240..439 as @e[type=item_display,tag=disco_ball,limit=1] at @s run particle dust{color:[0.8,0.0,1.0],scale:2} ~ ~-5 ~ 1.5 1.25 1.5 0 33 force

# Rotating spotlight beams from ball to floor - Yellow (11 seconds - stops 1 second before end)
execute if score #disco disco_timer matches 21..239 as @e[type=item_display,tag=disco_ball,limit=1] at @s run particle dust{color:[1.0,1.0,0.0],scale:2} ~ ~-5 ~ 1.5 1.25 1.5 0 33 force