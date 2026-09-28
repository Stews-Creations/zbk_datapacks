# Cleanup remains valid after map selection changes; only completed launch vehicles are removed.
# Clean up armor stand vehicles after landing
execute as @e[type=armor_stand,tag=115_launch_cleanup] run kill @s
