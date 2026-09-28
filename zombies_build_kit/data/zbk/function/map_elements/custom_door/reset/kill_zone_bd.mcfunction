# === MACRO: Kill block_displays and item_displays in zone cuboid ===
# Called from: reset/restore_zone, build_kit/load_zone
$kill @e[type=block_display,x=$(min_x),y=$(min_y),z=$(min_z),dx=$(dx),dy=$(dy),dz=$(dz)]
$kill @e[type=item_display,x=$(min_x),y=$(min_y),z=$(min_z),dx=$(dx),dy=$(dy),dz=$(dz)]
