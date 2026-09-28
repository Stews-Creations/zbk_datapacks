# Play death animation on the paired crawler display when this crawler_ai mob dies
# Runs as: the dying crawler_ai entity

scoreboard players operation #temp_cid crawler_id = @s crawler_id
execute as @e[type=item_display,tag=aj.block_bench_crawler.root] if score @s crawler_id = #temp_cid crawler_id run tag @s add crawler_dying
execute as @e[type=item_display,tag=aj.block_bench_crawler.root] if score @s crawler_id = #temp_cid crawler_id run function animated_java:block_bench_crawler/animations/animation_model_die/play
