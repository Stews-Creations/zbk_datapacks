# ===================================
# WUNDERFIZZ - CLAIM TIMEOUT
# ===================================
# Called when player doesn't claim within the timeout window
# Returns machine to idle state without granting perk
# ===================================

# Clean up display entities
kill @e[type=item_display,tag=wunderfizz_display,distance=..2]
kill @e[type=text_display,tag=wunderfizz_perk_name,distance=..2]

# Clean up tags
tag @a[tag=wunderfizz_buyer] remove wunderfizz_buyer
tag @s remove wunderfizz_active
tag @s remove wunderfizz_claiming

# Play Leave Sound Effect TODO not working
execute at @e[type=marker,tag=wunderfizz_active] run playsound zombies:wonderfizz.rand_perk_mach_leave master @a ~ ~ ~ 0.5 1

# Reset timer
scoreboard players set @s wunderfizz_timer 0
