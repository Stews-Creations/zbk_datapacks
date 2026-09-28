# Create the dedicated countdown objective.
scoreboard objectives add rocket_test_time dummy
scoreboard objectives add rkt_test_state dummy
scoreboard objectives add rkt_door_id dummy
scoreboard objectives add rkt_door_state dummy
scoreboard objectives add rkt_door_timer dummy
scoreboard objectives add rkt_fx_timer dummy
scoreboard objectives add rkt_hazard_timer dummy
scoreboard objectives add rkt_hazard_moved dummy

# Ensure the fake players exist without overwriting active state on reload.
scoreboard players add #rocket_test_launch rocket_test_time 0
scoreboard players add #rocket_test_launch rkt_test_state 0
scoreboard players add #rocket_test_launch rkt_fx_timer 0
scoreboard players add #rocket_test_launch rkt_hazard_timer 0
scoreboard players add #rocket_test_launch rkt_hazard_moved 0
