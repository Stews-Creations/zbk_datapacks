# The viewer tag is temporary audience state, cleared before and after the marker pass.
# Keep the helper synchronous so another viewer cannot replace the audience mid-pass.

# One local marker query per viewer. The tag exists only during this call.
tag @a[tag=zbk_marker_viewer] remove zbk_marker_viewer
tag @s add zbk_marker_viewer
execute as @e[type=marker,distance=..15] at @s run function zombies:build_kit/markers/display_nearby
tag @a[tag=zbk_marker_viewer] remove zbk_marker_viewer
