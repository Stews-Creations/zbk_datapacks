# === GRANT DOUBLE TAP PERK ===
# Grants the perk (point deduction handled by buy.mcfunction)

function zombies:debug/info {f:"PERK",m:"Double Tap granted"}

# Increment perk count
scoreboard players add @s perk_count 1

# Increment purchase order counter and assign to this perk
scoreboard players add @s perk_order 1
scoreboard players operation @s perk_doubletap = @s perk_order

# Play jingle
execute as @s run function zombies:map_elements/perks/double_tap/sound

execute as @s run function zbk:dispatch/voice_event_perk_pickup
