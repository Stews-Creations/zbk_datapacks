# === EXECUTE ZONE CLONE (MACRO) ===
# Forceloads storage chunks, clones zone to door_storage dimension, then unloads

$execute in zbk:door_storage run forceload add $(storage_x) $(storage_z) $(storage_end_x) $(storage_end_z)
$clone from minecraft:overworld $(min_x) $(min_y) $(min_z) $(max_x) $(max_y) $(max_z) to zbk:door_storage $(storage_x) $(storage_y) $(storage_z)
$execute in zbk:door_storage run forceload remove $(storage_x) $(storage_z) $(storage_end_x) $(storage_end_z)
