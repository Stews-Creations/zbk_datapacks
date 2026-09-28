# ===== DISCO ON LOAD =====
# Sets up scoreboards and trigger objectives for disco system
# Called from maps/der_eisendrache/quest/on_load.mcfunction

# Create scoreboard objectives
scoreboard objectives add disco_active dummy
scoreboard objectives add disco_timer dummy
scoreboard objectives add disco_used dummy
scoreboard objectives add disco_start trigger
