# === MACRO: Summon item_display at saved position ===
# Called from: reset/restore_item_displays
$summon item_display $(x) $(y) $(z) {view_range:0.35f,Tags:["cd_restore_id_temp","cd_door_id"]}
