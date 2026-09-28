# ===================================
# CHECK-PAUSE WRAPPER
# ===================================
# This function is called by schedule commands (which can't use macros)
# It reads the animation data from storage and calls the actual check_pause function
# ===================================

function mystery_box:check_pause with storage mystery_box:temp animation_data
