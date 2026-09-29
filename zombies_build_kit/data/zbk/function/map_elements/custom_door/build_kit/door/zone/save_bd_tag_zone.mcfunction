# === MACRO: Tag block_displays and item_displays in zone cuboid ===
$tag @e[type=block_display,x=$(min_x),y=$(min_y),z=$(min_z),dx=$(dx),dy=$(dy),dz=$(dz)] add cd_save_bd
$tag @e[type=item_display,x=$(min_x),y=$(min_y),z=$(min_z),dx=$(dx),dy=$(dy),dz=$(dz)] add cd_save_id
