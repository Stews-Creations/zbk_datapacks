# Point @s (a turned piglin) at the nearest non-turned wave enemy for $(delta) ticks.
# Caller passes {delta:N} via function macro args.
# Used by turned/handle (delta=600, initial 30s lock) and turned/on_tick (delta=100,
# re-anger every tick with a small forward window so the piglin can't drift back to neutral).
#
# No-op if no non-turned wave enemy is in range.

execute store result score #anger_end_time temp run time query gametime
$scoreboard players add #anger_end_time temp $(delta)
execute if entity @e[type=zombified_piglin,distance=..40,tag=wave_zombie,tag=!turned_zombie,tag=!immune_elements] as @e[type=zombified_piglin,distance=..40,tag=wave_zombie,tag=!turned_zombie,tag=!immune_elements,sort=nearest,limit=1] run data modify storage zbk:temp turned_target set from entity @s UUID
execute if entity @e[type=zombified_piglin,distance=..40,tag=wave_zombie,tag=!turned_zombie,tag=!immune_elements] run data modify entity @s angry_at set from storage zbk:temp turned_target
execute if entity @e[type=zombified_piglin,distance=..40,tag=wave_zombie,tag=!turned_zombie,tag=!immune_elements] store result entity @s anger_end_time long 1 run scoreboard players get #anger_end_time temp
