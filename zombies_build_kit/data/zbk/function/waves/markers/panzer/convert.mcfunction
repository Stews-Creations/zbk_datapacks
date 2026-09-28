# === CONVERT TO PANZER MARKER ===
# Purpose: Convert spawned llama to a marker entity
# Called when a llama is detected from Panzer marker egg

# Only convert if the llama has the correct name from the spawn egg
execute if entity @s[name="Panzer Spawn Marker"] run summon marker ~ ~ ~ {Tags:["panzer_spawner"],data:{zone:0}}

# Kill the llama (only if it had the correct name)
execute if entity @s[name="Panzer Spawn Marker"] run tp @s ~ ~-500 ~
execute if entity @s[name="Panzer Spawn Marker"] run kill @s

# Mark as converted to prevent re-checking
tag @s add converted
