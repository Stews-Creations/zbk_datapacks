# Called as a close panel after eligible-owner airborne/exempt-support detection.
execute unless score #active zbk.de matches 1 run return 0
execute unless score #electric de_el_progress matches 1 run return 0
execute unless score @s de_ep_close matches 1 run return 0
$scoreboard players set #de_ep_id temp $(id)
execute unless score #de_ep_id temp matches 1..5 run return 0
$execute unless score #$(id) de_ep_set matches 1 run return 0
$execute if score #$(id) de_ep_seen matches 1 run return 0
$scoreboard players set #$(id) de_ep_seen 1
scoreboard players operation #runner de_ep_run = #1 de_bow_owner
scoreboard players add #count de_ep_run 1
execute store result storage zombies:de_el_panel_sound visit.count int 1 run scoreboard players get #count de_ep_run
function zbk_der_eisendrache:quest/bows/electric/wall_panels/effects/visit_sound with storage zombies:de_el_panel_sound visit
data remove storage zombies:de_el_panel_sound visit
execute as @a[tag=de_el_panel_runner,tag=debug] if score @s id = #runner de_ep_run run tellraw @s [{"text":"Electric wall run: ","color":"aqua"},{"score":{"name":"#count","objective":"de_ep_run"}},{"text":"/5 panels."}]
execute if score #count de_ep_run matches 5 run function zbk_der_eisendrache:quest/bows/electric/wall_panels/route/complete
