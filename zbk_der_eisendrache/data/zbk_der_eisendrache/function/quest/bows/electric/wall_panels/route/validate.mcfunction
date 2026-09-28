# Ground contact is checked before this; no elapsed-time or support-loss limit.
execute unless score #count de_ep_run matches 1.. run return 0
execute unless score #electric de_el_progress matches 1 run return run function zbk_der_eisendrache:quest/bows/electric/wall_panels/route/reset
execute unless score #runner de_ep_run = #1 de_bow_owner run return run function zbk_der_eisendrache:quest/bows/electric/wall_panels/route/reset
# An attempt belongs to one connected owner; it cannot transfer to someone else.
scoreboard players set #present de_ep_run 0
execute as @a[scores={id=1..}] if score @s id = #runner de_ep_run run scoreboard players set #present de_ep_run 1
execute unless score #present de_ep_run matches 1 run function zbk_der_eisendrache:quest/bows/electric/wall_panels/route/reset
