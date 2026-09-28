# Count is supplied only after a new unique panel earns credit in this attempt.
$execute as @a[tag=de_el_panel_runner] if score @s id = #runner de_ep_run at @s run playsound zbk_der_eisendrache:der_eisendrache.quest.bows.electric.rune_cross_0$(count) master @s ~ ~ ~ 1 1
