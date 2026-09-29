# Runs once for a lethal blast; already-dead targets are rejected before damage.
scoreboard players operation #blast_award stats = #blast_kill_bonus stats
execute if score global double_points matches 1 run scoreboard players operation #blast_award stats += #blast_kill_bonus stats
execute as @a if score @s id = #shooter_id stats run function zbk:combat/weapons/effects/explosive/kills/award_kill
execute if entity @s[tag=crawler_ai] as @a if score @s id = #shooter_id stats run function zbk:combat/enemies/events/voice_event_crawler_kill
execute unless entity @s[tag=crawler_ai] as @a if score @s id = #shooter_id stats run function zbk:combat/enemies/events/voice_event_kill
scoreboard players operation #map_killer temp = #shooter_id stats
function zbk:combat/enemies/lifecycle/killed
execute if entity @s[tag=crawler_ai] run function zbk:behavior/crawler/remove_paired_display
function zbk:combat/weapons/events/extension/effects/explosive/kill
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
execute if entity @s[type=zombified_piglin] run loot spawn ~ ~ ~ loot entities/zombified_piglin
execute if entity @s[type=wolf] run loot spawn ~ ~ ~ loot entities/wolf
