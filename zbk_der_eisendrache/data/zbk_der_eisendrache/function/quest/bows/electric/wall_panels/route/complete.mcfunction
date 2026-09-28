execute unless score #active zbk.de matches 1 run return 0
execute unless score #electric de_el_progress matches 1 run return 0
# Require every unique configured ID, not merely five entities or repeated contacts.
execute unless score #runner de_ep_run = #1 de_bow_owner run return 0
execute unless score #1 de_ep_seen matches 1 run return 0
execute unless score #2 de_ep_seen matches 1 run return 0
execute unless score #3 de_ep_seen matches 1 run return 0
execute unless score #4 de_ep_seen matches 1 run return 0
execute unless score #5 de_ep_seen matches 1 run return 0
scoreboard players set #electric de_el_progress 2
scoreboard players set #count de_ep_run 0
execute as @a at @s run playsound zbk_der_eisendrache:der_eisendrache.quest.bows.electric.rune_cross_done master @s ~ ~ ~ 1 1
execute as @a[tag=de_el_panel_runner,tag=debug] if score @s id = #1 de_bow_owner run tellraw @s {"text":"All five panels reached. Second quest segment complete!","color":"aqua"}
