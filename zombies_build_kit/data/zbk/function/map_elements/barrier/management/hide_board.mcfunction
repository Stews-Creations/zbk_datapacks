# ===================================
# BARRIER MANAGEMENT - HIDE BOARD
# ===================================
# Purpose: Hide this board entity (executed AS the board)
# ===================================

# Set view range to 0 to make invisible (preserves all transformation data)
data merge entity @s {view_range:0.0f}

# Tag as hidden so it won't be selected again
tag @s add barrier_hidden
