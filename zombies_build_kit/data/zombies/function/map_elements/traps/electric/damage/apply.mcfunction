# Read the selected partner coordinates together, then reuse those bounds for particles and damage.
# The execution origin remains corner one; changing it would shift the damage volume.

# === ELECTRIC TRAP EFFECTS ===
# Runs from one corner, with temp_partner tagged on the other corner

# === DAMAGE ENTITIES IN AREA ===
# Get corner positions
execute store result score #x1 trap_cost run data get entity @s Pos[0]
execute store result score #y1 trap_cost run data get entity @s Pos[1]
execute store result score #z1 trap_cost run data get entity @s Pos[2]
execute as @e[type=marker,tag=temp_partner,limit=1] run function zombies:map_elements/traps/electric/damage/read_partner

# Calculate differences (dx, dy, dz)
scoreboard players operation #dx trap_cost = #x2 trap_cost
scoreboard players operation #dx trap_cost -= #x1 trap_cost
scoreboard players operation #dy trap_cost = #y2 trap_cost
scoreboard players operation #dy trap_cost -= #y1 trap_cost
scoreboard players operation #dz trap_cost = #z2 trap_cost
scoreboard players operation #dz trap_cost -= #z1 trap_cost

# === VISUAL EFFECTS ===
# Use the same corner/delta scores as damage so particles always align.
function zombies:map_elements/traps/electric/particles/core/spawn_grid

# Store in storage for macro
execute store result storage minecraft:temp dx int 1 run scoreboard players get #dx trap_cost
execute store result storage minecraft:temp dy int 1 run scoreboard players get #dy trap_cost
execute store result storage minecraft:temp dz int 1 run scoreboard players get #dz trap_cost

# Tag mobs using rectangular volume
function zombies:map_elements/traps/electric/damage/tag_mobs with storage minecraft:temp

# Damage hostile mobs
execute as @e[type=#minecraft:hostile,tag=trap_target] at @s run damage @s 10 minecraft:lightning_bolt
execute as @e[type=#minecraft:hostile,tag=trap_target] at @s run effect give @s slowness 2 2 false
execute as @e[type=#minecraft:hostile,tag=trap_target] at @s run particle minecraft:electric_spark ~ ~1 ~ 0.3 0.5 0.3 0.1 10 force

# Damage players
execute as @a[tag=trap_target] at @s run damage @s 2 minecraft:lightning_bolt
execute as @a[tag=trap_target] at @s run particle minecraft:electric_spark ~ ~1 ~ 0.3 0.5 0.3 0.1 10 force
execute as @a[tag=trap_target] at @s run effect give @s slowness 1 1 true

# Cleanup
tag @e[type=#minecraft:hostile,tag=trap_target] remove trap_target
tag @a[tag=trap_target] remove trap_target

# === SOUND EFFECTS ===
# Play electric hum every 20 ticks (use modulo so it works for any duration)
scoreboard players operation #trap_mod trap_cost = @s trap_timer
scoreboard players set #20 trap_cost 20
scoreboard players operation #trap_mod trap_cost %= #20 trap_cost
execute if score #trap_mod trap_cost matches 0 run playsound zbk:traps.big master @a ~ ~ ~ 1 1
execute if score @s trap_timer matches 0 run playsound zbk:traps.start master @a ~ ~ ~ 1 1
