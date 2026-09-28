# Dispatched from on_tick when this marker's pap_anim reaches 160 (8s after buy, 4s after
# flag_down). Context: @s = the PaP marker, at @s. Lifts this machine's song lock and
# reverts any blanked purchase text that was waiting on it.

tag @s remove pap_song_lock

execute as @e[type=text_display,distance=..3,tag=pap_text_revert_pending,limit=1,sort=nearest] run data modify entity @s text set value [{"text":"Purchase","color":"gold","bold":true}]
execute as @e[type=text_display,distance=..3,tag=pap_text_revert_pending,limit=1,sort=nearest] run tag @s remove pap_text_revert_pending
