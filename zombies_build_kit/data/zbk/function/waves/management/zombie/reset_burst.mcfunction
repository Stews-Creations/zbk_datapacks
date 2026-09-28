scoreboard players set #pending wz_state 0
scoreboard players set #target wz_state 0
scoreboard players set #retry wz_state 0
scoreboard players set #attempts wz_state 0
scoreboard players set #success wz_state 0
scoreboard players set #global wave.burst_spawned 0
tag @e[type=marker,tag=wz_used] remove wz_used
tag @e[type=marker,tag=wz_failed_pass] remove wz_failed_pass
tag @e[type=marker,tag=wz_candidate] remove wz_candidate
tag @e[type=marker,tag=wz_selected] remove wz_selected
tag @e[type=marker,tag=wz_source_marker] remove wz_source_marker
tag @e[tag=wz_created] remove wz_created
tag @a[tag=wz_player] remove wz_player
tag @a[tag=wz_tried] remove wz_tried
