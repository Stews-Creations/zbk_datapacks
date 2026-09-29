# === MACRO: Animate Down - Clone + Fill ===
# Clones everything down by 1 Y within zone, fills top layer with air
# Called from: animations/down
$clone $(min_x) $(min_y_p1) $(min_z) $(max_x) $(max_y) $(max_z) $(min_x) $(min_y) $(min_z) replace force
