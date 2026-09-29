# === MACRO: Animate Up - Clone + Fill ===
# Clones everything up by 1 Y within zone, fills bottom layer with air
# Called from: animations/up
$clone $(min_x) $(min_y) $(min_z) $(max_x) $(max_y_m1) $(max_z) $(min_x) $(min_y_p1) $(min_z) replace force
