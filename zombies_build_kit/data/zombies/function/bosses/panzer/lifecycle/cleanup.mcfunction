# === PANZER CLEANUP ===
# Removes active Panzers, delayed spawns, projectiles, and lingering player burn state.

kill @e[type=minecraft:marker,tag=panzer_spawn_pending]
kill @e[type=minecraft:marker,tag=panzer_powerup_spawner]
kill @e[type=minecraft:item_display,tag=panzer_electric_projectile]

tag @e[type=minecraft:marker,tag=panzer_spawn_selected] remove panzer_spawn_selected
tag @e[type=minecraft:marker,tag=panzer_spawn_open] remove panzer_spawn_open

tag @a remove panzer_burning
scoreboard players set @a panzer_burn_timer 0
scoreboard players set @a panzer_burn_damage_cooldown 0

function zombies:bosses/panzer/model/removal/all
