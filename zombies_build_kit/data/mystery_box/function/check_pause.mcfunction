# ===================================
# UNIFIED CHECK-PAUSE SYSTEM
# ===================================
# This single macro file replaces 1,550+ individual check_pause files
#
# Macro parameters:
#   $(anim) - Animation name (e.g., "buy_east", "box_open")
#   $(frame) - Current frame number being checked
#   $(next) - Next frame number to execute
#
# Usage example:
#   function mystery_box:check_pause {anim:"buy_east", frame:"0", next:"1"}
#
# How it works:
# 1. Checks if entity has check_pause_$(frame) tag
# 2. Checks if entity does NOT have animation_pause tag
# 3. If both true, executes next keyframe
# ===================================

$execute as @e[tag=mystery_box_root,tag=check_pause_$(frame),tag=anim_$(anim)] unless entity @s[tag=animation_pause] at @s run function mystery_box:k/$(anim)/keyframe_$(next)
