# ===================================
# BARRIER MANAGEMENT - SHOW BOARD
# ===================================
# Purpose: Show this hidden board entity (executed AS the board)
# ===================================

# Restore view range to make visible again
data merge entity @s {view_range:0.5f}

# Remove hidden tag so it can be hidden again later
tag @s remove barrier_hidden
