# === MACRO: APPEND FIRST ID TO STRING ===
# Sets used_ids_string to the first ID (no leading comma)
# Args: new_id

$data modify storage zbk:temp used_ids_string set value "$(new_id)"
