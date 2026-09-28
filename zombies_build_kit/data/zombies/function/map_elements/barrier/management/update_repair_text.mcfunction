# ===================================
# BARRIER MANAGEMENT - UPDATE REPAIR TEXT
# ===================================
# Purpose: Show/hide repair text based on barrier state
#
# Context: Executed as barrier marker at @s
# ===================================

# ===== SHOW TEXT FOR DAMAGED BARRIERS =====
# When barrier is damaged (state 1-6), show text to nearby players (3 block view range)
execute if score @s barrier_state matches 1.. run data merge entity @e[type=text_display,tag=barrier_repair_text,distance=..3,limit=1] {view_range:3.0f}

# ===== HIDE TEXT FOR INTACT BARRIERS =====
# When barrier is fully repaired (state 0), hide text
execute if score @s barrier_state matches 0 run data merge entity @e[type=text_display,tag=barrier_repair_text,distance=..3,limit=1] {view_range:0.0f}
