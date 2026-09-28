# Clear only the unfinished loop, never completed quest stages or fire state.
# Notify the recorded runner once, before discarding an attempt with collected panels.
execute if score #count de_ep_run matches 1..4 as @a[scores={id=1..}] if score @s id = #runner de_ep_run at @s run playsound zbk_der_eisendrache:der_eisendrache.quest.bows.electric.rune_cross_fail master @s ~ ~ ~ 1 1
scoreboard players reset * de_ep_seen
scoreboard players set #count de_ep_run 0
scoreboard players reset #runner de_ep_run
scoreboard players set @e[type=marker,tag=de_el_panel_marker] de_ep_touch 0
scoreboard players set @e[type=marker,tag=de_el_panel_marker] de_ep_flash 0
