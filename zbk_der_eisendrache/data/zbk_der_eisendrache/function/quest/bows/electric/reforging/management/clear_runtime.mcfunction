# Cleanup must also work after deactivation; do not require the active stage here.
# Retain the persistent marker and stop vane spin when clearing an interrupted ascent.

kill @e[tag=de_er_runtime]
scoreboard players set #active de_er_state 0
# Prevent normal spin from resuming when an active ascent is cleared.
execute if score #sequence de_er_state matches 1 run tag @e[type=item_display,tag=de_el_vane_head] remove de_el_vane_spinning
stopsound @a master zbk_der_eisendrache:der_eisendrache.quest.bows.electric.stormbow_tornado_vane
scoreboard players reset * de_vane_audio
