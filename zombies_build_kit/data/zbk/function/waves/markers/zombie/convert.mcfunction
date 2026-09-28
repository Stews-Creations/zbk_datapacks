# === CONVERT TO ZOMBIE MARKER ===
# Purpose: Convert spawned axolotl to a marker entity
# Called when an axolotl is detected from zombie marker egg

# Only convert if the axolotl has the correct name from the spawn egg
# Modes: 0 = standard; 1-4 = hole east/south/west/north; 5-8 = wall east/south/west/north
execute if entity @s[name="Zombie Spawn Marker"] run summon marker ~ ~ ~ {Tags:["zombie_spawner"],data:{zone:0,mode:0}}

# Kill the axolotl (only if it had the correct name)
execute if entity @s[name="Zombie Spawn Marker"] run tp @s ~ ~-500 ~
execute if entity @s[name="Zombie Spawn Marker"] run kill @s

# Mark as converted to prevent re-checking
tag @s add converted
