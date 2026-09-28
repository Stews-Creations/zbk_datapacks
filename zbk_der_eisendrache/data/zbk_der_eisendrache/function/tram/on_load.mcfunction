# ===================================
# TRAM MODULE - LOAD
# ===================================
# Purpose: Initialize tram scoreboards and clear runtime entities.
# ===================================

# Route configuration and movement.
scoreboard objectives add tram_link_id dummy
scoreboard objectives add tram_start_delay dummy
scoreboard objectives add tram_auto_start dummy
scoreboard objectives add tram_destination dummy
scoreboard objectives add tram_delay_timer dummy
scoreboard objectives add tram_timer dummy
scoreboard objectives add tram_sway_timer dummy
scoreboard objectives add tram_motor_timer dummy
scoreboard objectives add tram_const dummy

# Stationary platform-door configuration and state.
scoreboard objectives add tram_door_id dummy
scoreboard objectives add tram_door_state dummy

# Called-route reward state.
scoreboard objectives add tram_reward dummy
scoreboard objectives add tram_reward_type dummy
scoreboard objectives add tram_reward_own dummy
scoreboard objectives add tram_r_state dummy
scoreboard objectives add tram_r_timer dummy

# Per-game, per-player Tram 1 easter egg.
scoreboard objectives add tram_ee_ready dummy
scoreboard objectives add tram_ee_calls dummy
scoreboard objectives add tram_ee_used dummy
scoreboard objectives add tram_ee_timer dummy
scoreboard objectives add tram_fuse_cd dummy

scoreboard players set #ticks_per_second tram_const 20
scoreboard players set #tram_skip_reset global 0
execute unless score #global tram_ee_timer matches 0.. run scoreboard players set #global tram_ee_timer 0
