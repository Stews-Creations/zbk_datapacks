# === TOGGLE SPAWN MARKER PARTICLES ===
# Purpose: Toggle visibility of spawn marker particles for map building
# Useful for placing and finding markers, can be hidden during gameplay

# Toggle the value (0 -> 1, 1 -> 0)
# Store current value to temp, then toggle based on temp
execute store result score #temp wave.show_markers run scoreboard players get #global wave.show_markers
execute if score #temp wave.show_markers matches 0 run scoreboard players set #global wave.show_markers 1
execute if score #temp wave.show_markers matches 1 run scoreboard players set #global wave.show_markers 0

# Notify player of new state
execute if score #global wave.show_markers matches 1 as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Waves] ","color":"gold"},{"text":"Spawn marker particles: ","color":"white"},{"text":"VISIBLE","color":"green"}]
execute if score #global wave.show_markers matches 0 as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Waves] ","color":"gold"},{"text":"Spawn marker particles: ","color":"white"},{"text":"HIDDEN","color":"red"}]
