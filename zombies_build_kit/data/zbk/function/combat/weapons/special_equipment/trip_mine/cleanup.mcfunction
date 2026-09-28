# ===================================
# CLEAN UP TRIP MINES
# ===================================
# Called on datapack reload and game reset.

kill @e[type=item_display,tag=trip_mine_display]
kill @e[type=marker,tag=trip_mine_marker]
