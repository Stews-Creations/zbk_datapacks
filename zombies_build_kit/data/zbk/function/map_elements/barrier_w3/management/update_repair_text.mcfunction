# ===================================
# BARRIER W3 MANAGEMENT - UPDATE REPAIR TEXT
# ===================================
# Context: Executed as barrier_w3 marker at @s

# Show text for damaged barriers
execute if score @s bw3_state matches 1.. run data merge entity @e[type=text_display,tag=barrier_w3_repair_text,distance=..3,limit=1] {view_range:3.0f}

# Hide text for intact barriers
execute if score @s bw3_state matches 0 run data merge entity @e[type=text_display,tag=barrier_w3_repair_text,distance=..3,limit=1] {view_range:0.0f}
