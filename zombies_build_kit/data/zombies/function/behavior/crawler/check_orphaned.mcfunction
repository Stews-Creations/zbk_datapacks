# Check if this crawler display's paired AI mob still exists
# Runs as: each crawler display root entity
# Skip displays playing death animation (they clean up after animation finishes)
# If no matching crawler_ai found and not dying, remove this display

execute if entity @s[tag=crawler_dying] run return 0

scoreboard players operation #temp_cid crawler_id = @s crawler_id
scoreboard players set #found temp 0
execute as @e[type=zombified_piglin,tag=crawler_ai] if score @s crawler_id = #temp_cid crawler_id run scoreboard players set #found temp 1
execute if score #found temp matches 0 run tag @s add crawler_dying
execute if score #found temp matches 0 run function animated_java:block_bench_crawler/animations/animation_model_die/play
