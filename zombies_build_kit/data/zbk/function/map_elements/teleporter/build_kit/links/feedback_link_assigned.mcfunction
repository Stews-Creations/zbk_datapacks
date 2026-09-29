# === FEEDBACK - LINK ASSIGNED ===
# Macro function to provide feedback with marker type

$tellraw @a [{"text":"[Build Manager] ","color":"gold"},{"text":"$(marker_type) marker linked to ID ","color":"green"},{"score":{"name":"#selected_id","objective":"global"},"color":"yellow","bold":true}]
