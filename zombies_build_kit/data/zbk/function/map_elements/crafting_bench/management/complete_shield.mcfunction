# Builder context. Only the winning bench owns this recipe for the current game.
scoreboard players operation #shield_bench cb_id = @s cb_target
function zbk:map_elements/crafting_bench/management/mark_built {recipe:"shield"}
execute at @s as @e[type=marker,tag=cb_marker,distance=..2.5] if score @s cb_id = #shield_bench cb_id at @s run function zbk:map_elements/crafting_bench/display/sync_shield
