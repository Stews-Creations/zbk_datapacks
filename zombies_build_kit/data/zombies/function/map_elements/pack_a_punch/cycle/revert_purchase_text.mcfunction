# Scheduled from claim.mcfunction with a 10t delay (~0.5s) so "Purchase" appears AFTER the
# equip cooldown clears. For each pending text, check the nearest marker individually — if
# THAT machine's song lock is still on, leave the text blank (unlock_after_song will revert
# it when the lock lifts). Other machines' song locks must not block this machine's revert.

execute as @e[type=text_display,tag=pap_text_revert_pending] at @s unless entity @e[type=marker,distance=..3,tag=pack_a_punch,tag=pap_song_lock,limit=1,sort=nearest] run data modify entity @s text set value [{"text":"Purchase","color":"gold","bold":true}]
execute as @e[type=text_display,tag=pap_text_revert_pending] at @s unless entity @e[type=marker,distance=..3,tag=pack_a_punch,tag=pap_song_lock,limit=1,sort=nearest] run tag @s remove pap_text_revert_pending
