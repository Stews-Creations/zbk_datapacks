# This function grants a random perk that the player doesn't have yet
# Called after the cycle animation completes

# Get the buyer
execute as @a[tag=wunderfizz_buyer] at @s run tag @s add current_buyer

# Try each perk in random order based on the final random value
# The wunderfizz_perk score determines which perk to try first

# Perk 1: Juggernog - Tag first, then grant
execute if score @e[type=marker,tag=wunderfizz_active,limit=1] wunderfizz_perk matches 0 as @a[tag=current_buyer,tag=!perk_granted] if score @s perk_jugg matches 0 run tag @s add perk_granted
execute if score @e[type=marker,tag=wunderfizz_active,limit=1] wunderfizz_perk matches 0 as @a[tag=current_buyer,tag=perk_granted] if score @s perk_jugg matches 0 run function zbk:map_elements/perks/juggernog/grant

# Perk 2: Speed Cola - Tag first, then grant
execute if score @e[type=marker,tag=wunderfizz_active,limit=1] wunderfizz_perk matches 1 as @a[tag=current_buyer,tag=!perk_granted] if score @s perk_speed matches 0 run tag @s add perk_granted
execute if score @e[type=marker,tag=wunderfizz_active,limit=1] wunderfizz_perk matches 1 as @a[tag=current_buyer,tag=perk_granted] if score @s perk_speed matches 0 run function zbk:map_elements/perks/speed_cola/grant

# Perk 3: Double Tap - Tag first, then grant
execute if score @e[type=marker,tag=wunderfizz_active,limit=1] wunderfizz_perk matches 2 as @a[tag=current_buyer,tag=!perk_granted] if score @s perk_doubletap matches 0 run tag @s add perk_granted
execute if score @e[type=marker,tag=wunderfizz_active,limit=1] wunderfizz_perk matches 2 as @a[tag=current_buyer,tag=perk_granted] if score @s perk_doubletap matches 0 run function zbk:map_elements/perks/double_tap/grant

# Perk 4: Stamina Up - Tag first, then grant
execute if score @e[type=marker,tag=wunderfizz_active,limit=1] wunderfizz_perk matches 3 as @a[tag=current_buyer,tag=!perk_granted] if score @s perk_stamina matches 0 run tag @s add perk_granted
execute if score @e[type=marker,tag=wunderfizz_active,limit=1] wunderfizz_perk matches 3 as @a[tag=current_buyer,tag=perk_granted] if score @s perk_stamina matches 0 run function zbk:map_elements/perks/stamina_up/grant

# Perk 5: Quick Revive - Tag first, then grant
execute if score @e[type=marker,tag=wunderfizz_active,limit=1] wunderfizz_perk matches 4 as @a[tag=current_buyer,tag=!perk_granted] if score @s perk_revive matches 0 run tag @s add perk_granted
execute if score @e[type=marker,tag=wunderfizz_active,limit=1] wunderfizz_perk matches 4 as @a[tag=current_buyer,tag=perk_granted] if score @s perk_revive matches 0 run function zbk:map_elements/perks/quick_revive/grant

# Perk 6: Mule Kick - Tag first, then grant
execute if score @e[type=marker,tag=wunderfizz_active,limit=1] wunderfizz_perk matches 5 as @a[tag=current_buyer,tag=!perk_granted] if score @s perk_mule matches 0 run tag @s add perk_granted
execute if score @e[type=marker,tag=wunderfizz_active,limit=1] wunderfizz_perk matches 5 as @a[tag=current_buyer,tag=perk_granted] if score @s perk_mule matches 0 run function zbk:map_elements/perks/mule_kick/grant

# If the first perk was already owned, try the next ones in sequence until we find one they don't have
# Calls grant_fallback which uses return to stop after granting one perk
execute as @a[tag=current_buyer,tag=!perk_granted] run function zbk:map_elements/perks/wunderfizz/gameplay/grant_fallback

# Play success sound
execute at @e[type=marker,tag=wunderfizz_active] run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1.2

# Clean up the display entities
execute at @e[type=marker,tag=wunderfizz_active] run kill @e[type=item_display,tag=wunderfizz_display,distance=..2]
execute at @e[type=marker,tag=wunderfizz_active] run kill @e[type=text_display,tag=wunderfizz_perk_name,distance=..2]

# Clean up tags
tag @a[tag=current_buyer] remove current_buyer
tag @a[tag=perk_granted] remove perk_granted
tag @a[tag=wunderfizz_buyer] remove wunderfizz_buyer
tag @e[type=marker,tag=wunderfizz_active] remove wunderfizz_active
tag @e[type=marker,tag=wunderfizz_cycling] remove wunderfizz_cycling
tag @e[type=marker,tag=wunderfizz_claiming] remove wunderfizz_claiming
