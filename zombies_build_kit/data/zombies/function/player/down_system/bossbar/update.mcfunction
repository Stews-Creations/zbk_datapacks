$bossbar add zombies:revive_$(player_id) "Reviving..."
$bossbar set zombies:revive_$(player_id) color red
$bossbar set zombies:revive_$(player_id) max $(max)
$bossbar set zombies:revive_$(player_id) visible true
$bossbar set zombies:revive_$(player_id) players @a[tag=revive_bar_viewer_tmp]
$bossbar set zombies:revive_$(player_id) value $(value)
