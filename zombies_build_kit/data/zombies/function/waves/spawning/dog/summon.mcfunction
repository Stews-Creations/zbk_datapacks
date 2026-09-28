# === SUMMON DOG ===
# Purpose: Summon a wolf at the selected spawn marker
# Called when a valid spawn location is found during dog rounds

# Summon wolf at marker location
execute at @e[type=marker,tag=spawn_selected] run summon minecraft:wolf ~ ~ ~ {Tags:["wave_dog","wave_enemy","new_wave_dog"],AngerTime:1000,PersistenceRequired:1b,Fire:32767s,attributes:[{id:"minecraft:scale",base:1.4},{id:"minecraft:attack_damage",base:4},{id:"minecraft:follow_range",base:2048}],active_effects:[{id:"minecraft:fire_resistance",amplifier:0,duration:-1,show_particles:0b}]}
tag @e[type=wolf,tag=new_wave_dog,distance=..1,limit=1,sort=nearest] add immunity_target
function zombies:combat/immunity/apply_from_marker
execute as @e[type=wolf,tag=new_wave_dog] at @s run function zbk:dispatch/enemy_spawned
tag @e[type=wolf,tag=new_wave_dog,distance=..1] remove new_wave_dog

# Dog spawn sound (plays at spawn marker location for nearby players)
execute at @e[type=marker,tag=spawn_selected] run function zombies:sounds/play/dog_spawn

# Increment spawn counter (dog was successfully spawned)
scoreboard players add #global wave.spawned 1

# Note: Dogs don't scale health like zombies do in the original system
