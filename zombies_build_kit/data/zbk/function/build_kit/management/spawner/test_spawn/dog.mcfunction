# === TEST SPAWN DOG ===
# Runs as and at a dog spawner marker. Does not increment wave.spawned.

summon minecraft:wolf ~ ~ ~ {Tags:["wave_dog","wave_enemy","new_wave_dog"],AngerTime:1000,PersistenceRequired:1b,Fire:32767s,attributes:[{id:"minecraft:scale",base:1.4},{id:"minecraft:attack_damage",base:4},{id:"minecraft:follow_range",base:2048}],active_effects:[{id:"minecraft:fire_resistance",amplifier:0,duration:-1,show_particles:0b}]}
tag @e[type=wolf,tag=new_wave_dog,distance=..1,limit=1,sort=nearest] add immunity_target
function zbk:combat/immunity/apply_from_marker
tag @e[type=wolf,tag=new_wave_dog,distance=..1] remove new_wave_dog
function zbk:sounds/play/dog_spawn

tellraw @a[tag=debug,scores={debug_level=4..}] [{"text":"[Build Manager] ","color":"gold"},{"text":"Test spawned one dog.","color":"green"}]
