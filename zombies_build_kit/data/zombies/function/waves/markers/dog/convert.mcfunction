# === CONVERT TO DOG MARKER ===
# Purpose: Convert spawned wolf to a marker entity
# Called when a wolf is detected from dog marker egg

# Only convert if the wolf has the correct name from the spawn egg
execute if entity @s[name="Dog Spawn Marker"] run summon marker ~ ~ ~ {Tags:["dog_spawner"],data:{zone:0}}

# Kill the wolf (only if it had the correct name)
execute if entity @s[name="Dog Spawn Marker"] run tp @s ~ ~-500 ~
execute if entity @s[name="Dog Spawn Marker"] run kill @s

# Mark as converted to prevent re-checking
tag @s add converted
