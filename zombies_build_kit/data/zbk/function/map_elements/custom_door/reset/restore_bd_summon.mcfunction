# === MACRO: Summon block_display at saved position ===
# Called from: reset/restore_block_displays
$summon block_display $(x) $(y) $(z) {view_range:0.35f,Tags:["cd_restore_temp","cd_door_bd"]}
