# === DISPLAY ZONE PARTICLES ===
# Runs every tick when zone highlight is active
# Shows particles at all markers matching the highlighted zone

# Show particles at spawners with matching zone
execute as @e[type=marker,tag=zombie_spawner] at @s run function zombies:build_kit/management/zones/check_spawner_zone_and_particle_green
execute as @e[type=marker,tag=dog_spawner] at @s run function zombies:build_kit/management/zones/check_spawner_zone_and_particle_red
function zbk:dispatch/extension/build_kit/management/zones/display_zone_particles/1
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

# Show particles at doors with matching zone in zones array
execute as @e[type=marker,tag=door] at @s run function zombies:build_kit/management/zones/check_door_zone_and_particle

# Show particles at powered doors with matching zone in zones array
execute as @e[type=marker,tag=door_powered] at @s run function zombies:build_kit/management/zones/check_door_zone_and_particle
