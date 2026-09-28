# === UPDATE TRAP SIGN (SIMPLE) ===
# Updates the sign at the trap_sign marker location
# Runs as trap_sign marker at its position

# Update the sign's cost line (line 2)
$data modify block ~ ~ ~ front_text.messages[1] set value {"text":"Cost: $(cost)","color":"yellow"}
