# Internal full quest reset; retain placement and refund pending bows safely.
function zbk_der_eisendrache:quest/bows/electric/ritual_box/management/clear_runtime
scoreboard players set #phase de_eb_state 0
scoreboard players set #souls de_eb_souls 0
scoreboard players set #clock de_eb_time 0
scoreboard players set #buyer de_eb_owner 0
execute as @a[scores={de_eb_slot=1..3}] at @s run function zbk_der_eisendrache:quest/bows/electric/ritual_box/reward/recover
