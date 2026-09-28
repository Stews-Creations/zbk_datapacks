# Called AS the picking player (@s = player). Activate then kill the nearby DM display.
function zombies:combat/powerups/death_machine/activate
execute at @s as @e[type=item_display,tag=death_machine,distance=..2] run kill @s
