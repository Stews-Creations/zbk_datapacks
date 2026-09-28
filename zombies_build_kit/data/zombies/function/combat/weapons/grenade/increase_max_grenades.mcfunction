# === GRENADE UPGRADE - ROUND 2 ===
# Purpose: Upgrade max grenades to 4 and give 2 grenades to all players
# Called from waves/management/rounds/start_round.mcfunction when round 2 starts

# Set max grenade capacity to 4 for all players
execute as @a run scoreboard players set @s max_grenade_ammo 4

# Give 2 grenades to all players (so they have current + 2, capped at 4)
execute as @a run scoreboard players add @s grenade_ammo 2

# Cap grenades at max (in case they already had grenades)
execute as @a if score @s grenade_ammo > @s max_grenade_ammo run scoreboard players operation @s grenade_ammo = @s max_grenade_ammo

# Debug logging
function zombies:debug/event {f:"GRENADE",m:"Upgraded to 4 max grenades!"}
