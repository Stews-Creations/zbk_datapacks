# Shared four-perk cap and duplicate protection for every acquisition route.
execute if score @s perk_deadshot matches 1.. run return fail
execute if score @s perk_count matches 4.. run tellraw @s {"text":"You already have 4 perks!","color":"red"}
execute if score @s perk_count matches 4.. run return fail

# Shared gun collision applies headshot damage, blood and tracking while owned.
scoreboard players add @s perk_count 1
scoreboard players add @s perk_order 1
scoreboard players operation @s perk_deadshot = @s perk_order
playsound zbk:perks.perk_buy master @s ~ ~ ~ 0.7 1
function zbk:map_elements/perks/events/voice_event_perk_pickup
return 1
