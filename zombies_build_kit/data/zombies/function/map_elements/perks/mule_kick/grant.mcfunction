# === GRANT MULE KICK PERK ===
# Grants the perk (point deduction handled by buy.mcfunction)

function zombies:debug/info {f:"PERK",m:"Mule Kick granted"}

# Increment perk count
scoreboard players add @s perk_count 1

# Increment purchase order counter and assign to this perk
scoreboard players add @s perk_order 1
scoreboard players operation @s perk_mule = @s perk_order

# Play jingle
execute as @s run function zombies:map_elements/perks/mule_kick/sound

execute as @s run function zbk:dispatch/voice_event_perk_pickup
