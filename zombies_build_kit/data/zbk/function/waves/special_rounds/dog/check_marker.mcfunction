# === CHECK DOG MARKER ===
# Purpose: Process dog death markers - spawn max ammo if last dog, otherwise kill marker
# Called when a stone with dog_round_marker custom data is detected
# Run as the marker item, at its location

# Dog death sound (plays at death location for nearby players)
function zbk:sounds/play/dog_death

# If there are still dogs alive, this is NOT the last dog - kill the marker
execute if entity @e[tag=wave_dog] run kill @s

# If no dogs alive AND all dogs spawned AND no max ammo spawned yet, this is the last dog - play end sound and spawn max ammo
execute unless entity @e[tag=wave_dog] if score #global wave.spawned >= #global wave.spawn_count unless entity @e[tag=dog_round_max_ammo] as @a at @s run function zbk:sounds/play/dog_end
execute unless entity @e[tag=wave_dog] if score #global wave.spawned >= #global wave.spawn_count unless entity @e[tag=dog_round_max_ammo] run summon item_display ~ ~0.5 ~ {Tags:[pickup_item, max_ammo, dog_round_max_ammo],item:{id:"minecraft:slime_ball",count:1,components:{"minecraft:item_model":"zbk:max_ammo"}},item_display:"fixed",brightness:{block:15,sky:15}}
execute unless entity @e[tag=wave_dog] run kill @s
