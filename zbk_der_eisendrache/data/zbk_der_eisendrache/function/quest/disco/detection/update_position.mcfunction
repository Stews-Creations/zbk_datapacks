# ===== UPDATE DISCO INTERACTION POSITION =====
# Updates the interaction entity position to follow the rotating disco ball
# Called every tick from on_tick.mcfunction
# Uses relative coordinates: ^right ^up ^forward
# The arm extends south, so we use negative forward offset (^ ^4 ^-2 = 0 right, 4 up, -2 forward/south)

# Teleport interaction to the disco ball's position with rotating offset
execute as @e[type=item_display,tag=disco_ball] at @s positioned ^ ^2 ^-5 run tp @e[type=interaction,tag=disco_interaction,limit=1,sort=nearest] ~ ~ ~
