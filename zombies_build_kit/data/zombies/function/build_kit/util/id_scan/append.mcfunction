# === MACRO: APPEND SUBSEQUENT ID TO STRING ===
# Appends a comma-separated ID to the existing used_ids_string
# Args: current (existing string), new_id

$data modify storage zombies:temp used_ids_string set value "$(current), $(new_id)"
