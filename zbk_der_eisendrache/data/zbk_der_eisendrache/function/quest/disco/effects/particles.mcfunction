# ===== DISCO PARTICLES EFFECT =====
# Creates ambient particle effects throughout the disco area
# Called every tick when disco is active
# Executes at disco ball position (ceiling mounted, floor is ~-10 below)

# Firework particles for disco atmosphere (12 blocks from center) - stops 1 second before end
execute if score #disco disco_timer matches 21.. as @e[type=item_display,tag=disco_ball,limit=1] at @s run particle firework ~12 ~ ~ 0.2 4 0.2 0 3 force
execute if score #disco disco_timer matches 21.. as @e[type=item_display,tag=disco_ball,limit=1] at @s run particle firework ~-12 ~ ~ 0.2 4 0.2 0 3 force

# Note block particles for music effect (6 blocks from center) - stops 1 second before end
execute if score #disco disco_timer matches 20 as @e[type=item_display,tag=disco_ball,limit=1] at @s run particle note ~6 ~-3 ~6 0.5 0.5 0.5 1 5 force
execute if score #disco disco_timer matches 25 as @e[type=item_display,tag=disco_ball,limit=1] at @s run particle note ~-6 ~-3 ~6 0.5 0.5 0.5 1 5 force
execute if score #disco disco_timer matches 30 as @e[type=item_display,tag=disco_ball,limit=1] at @s run particle note ~6 ~-3 ~-6 0.5 0.5 0.5 1 5 force
execute if score #disco disco_timer matches 35 as @e[type=item_display,tag=disco_ball,limit=1] at @s run particle note ~-6 ~-3 ~-6 0.5 0.5 0.5 1 5 force

# Rainbow dust trail around the room (12 blocks from center) - stops 1 second before end
execute if score #disco disco_timer matches 21.. as @e[type=item_display,tag=disco_ball,limit=1] at @s run particle dust{color:[1.0,0.0,0.5],scale:1} ~12 ~-5 ~12 0.3 0.3 0.3 0 5 force
execute if score #disco disco_timer matches 21.. as @e[type=item_display,tag=disco_ball,limit=1] at @s run particle dust{color:[0.5,0.0,1.0],scale:1} ~-12 ~-5 ~12 0.3 0.3 0.3 0 5 force
execute if score #disco disco_timer matches 21.. as @e[type=item_display,tag=disco_ball,limit=1] at @s run particle dust{color:[0.0,1.0,0.5],scale:1} ~12 ~-5 ~-12 0.3 0.3 0.3 0 5 force
execute if score #disco disco_timer matches 21.. as @e[type=item_display,tag=disco_ball,limit=1] at @s run particle dust{color:[1.0,0.5,0.0],scale:1} ~-12 ~-5 ~-12 0.3 0.3 0.3 0 5 force

# Enchantment table particles for mystical effect (12 block radius) - stops 1 second before end
execute if score #disco disco_timer matches 21.. as @e[type=item_display,tag=disco_ball,limit=1] at @s run particle enchant ~ ~-2 ~ 12 3 12 0 40 force
