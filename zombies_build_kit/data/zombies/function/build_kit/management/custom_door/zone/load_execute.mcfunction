# === EXECUTE ZONE LOAD (MACRO) ===
# Forceloads storage chunks, clones zone from door_storage to overworld, then unloads

$execute in zombies:door_storage run forceload add $(storage_x) $(storage_z) $(storage_end_x) $(storage_end_z)
$clone from zombies:door_storage $(storage_x) $(storage_y) $(storage_z) $(storage_end_x) $(storage_end_y) $(storage_end_z) to minecraft:overworld $(min_x) $(min_y) $(min_z) masked force
$execute in zombies:door_storage run forceload remove $(storage_x) $(storage_z) $(storage_end_x) $(storage_end_z)
