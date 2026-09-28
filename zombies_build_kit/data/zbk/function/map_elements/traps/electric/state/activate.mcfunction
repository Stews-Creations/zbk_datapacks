# === ACTIVATE ELECTRIC TRAP ===
# Called on the trap marker when purchased
# Sets up the trap to be active

# Remove ready tag and add active tag
tag @s remove trap_ready
tag @s add trap_active

# Store duration in timer (convert seconds to ticks: seconds * 20)
execute store result score @s trap_timer run data get entity @s data.duration 20

# Visual and audio effects
particle minecraft:electric_spark ~ ~1 ~ 1.5 1 1.5 0.1 50 force
particle minecraft:explosion ~ ~1 ~ 0 0 0 0 1 force
playsound minecraft:entity.lightning_bolt.thunder master @a ~ ~ ~ 1 1.2
playsound minecraft:block.beacon.activate master @a ~ ~ ~ 0.8 1.5
