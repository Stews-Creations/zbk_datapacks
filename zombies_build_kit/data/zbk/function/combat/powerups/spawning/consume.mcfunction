# Do not batch the shared drop gate ahead of this helper.
# Successful spawn functions update the cap and kill requirement before the next item is processed.

# Internal item-context handler. Callers supply a fixed kind and human-readable label.
# Each successful spawn updates the shared drop gate and consumes this candidate.
$execute if function zbk:api/powerups/can_spawn run return run function zbk:combat/powerups/$(kind)/spawn

# Rejected candidates are consumed as before; diagnostics do not search the world again.
$execute if score #global game_active matches 1.. unless score #global drop_req_kills matches ..0 as @a[tag=debug,scores={debug_level=3..}] run tellraw @s [{"text":"[DROP] ","color":"gold"},{"text":"$(label) BLOCKED (req_kills: ","color":"red"},{"score":{"name":"#global","objective":"drop_req_kills"},"color":"yellow"},{"text":")","color":"red"}]
$execute if score #global game_active matches 1.. if score #global drop_req_kills matches ..0 if score #global drop_round_drops matches 4.. as @a[tag=debug,scores={debug_level=3..}] run tellraw @s [{"text":"[DROP] ","color":"gold"},{"text":"$(label) BLOCKED - max round drops (","color":"red"},{"score":{"name":"#global","objective":"drop_round_drops"},"color":"yellow"},{"text":"/4)","color":"red"}]
kill @s
