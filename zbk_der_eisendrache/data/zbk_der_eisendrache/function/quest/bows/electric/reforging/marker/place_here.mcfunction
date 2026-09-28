# A move preserves readiness; a new marker starts waiting. Never reset quest progress.
function zbk_der_eisendrache:quest/bows/electric/reforging/management/clear_runtime
kill @e[type=marker,tag=de_er_marker]
summon marker ~ ~ ~ {Tags:["de_er_marker"]}
tp @e[type=marker,tag=de_er_marker,limit=1] ~ ~ ~ ~ 0
scoreboard players add #sequence de_er_state 0
scoreboard players operation @e[type=marker,tag=de_er_marker,limit=1] de_er_state = #sequence de_er_state
scoreboard players set #time de_er_tick 0
scoreboard players set #placed de_er_state 1
execute if score #electric de_el_progress matches 3 as @e[type=marker,tag=de_er_marker,limit=1] at @s rotated as @s run function zbk_der_eisendrache:quest/bows/electric/reforging/display/sync
tellraw @s {"text":"Reforging marker placed. The bottom arrow appears after all three electric tornadoes are complete.","color":"aqua"}
