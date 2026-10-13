# Shared four-perk cap and duplicate protection for every acquisition route.
execute if score @s perk_doubletap matches 1.. run return fail
execute if score @s perk_count matches 4.. run tellraw @s {"text":"You already have 4 perks!","color":"red"}
execute if score @s perk_count matches 4.. run return fail

# === GRANT DOUBLE TAP PERK ===
# Grants the perk (point deduction handled by buy.mcfunction)

function zbk:debug/info {f:"PERK",m:"Double Tap granted"}

# Increment perk count
scoreboard players add @s perk_count 1

# Increment purchase order counter and assign to this perk
scoreboard players add @s perk_order 1
scoreboard players operation @s perk_doubletap = @s perk_order

# Play jingle
execute as @s run function zbk:map_elements/perks/double_tap/sound

execute as @s run function zbk:map_elements/perks/events/voice_event_perk_pickup

return 1
