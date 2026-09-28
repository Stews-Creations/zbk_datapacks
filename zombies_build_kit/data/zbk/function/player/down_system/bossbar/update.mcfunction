$bossbar add zbk:revive_$(player_id) "Reviving..."
$bossbar set zbk:revive_$(player_id) color red
$bossbar set zbk:revive_$(player_id) max $(max)
$bossbar set zbk:revive_$(player_id) visible true
$bossbar set zbk:revive_$(player_id) players @a[tag=revive_bar_viewer_tmp]
$bossbar set zbk:revive_$(player_id) value $(value)
