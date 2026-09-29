# Refund a stranded zombie/crawler and remove it without drops.
# Runs as and at: zombified piglin.

function zbk:waves/spawning/zombie/accounting/refund

scoreboard players set #relocation_crawler_id crawler_id 0
execute if entity @s[tag=crawler_ai] if score @s crawler_id matches 1.. run scoreboard players operation #relocation_crawler_id crawler_id = @s crawler_id
execute if entity @s[tag=crawler_ai] if score #relocation_crawler_id crawler_id matches 1.. as @e[type=item_display,tag=aj.block_bench_crawler.root] if score @s crawler_id = #relocation_crawler_id crawler_id run function animated_java:block_bench_crawler/remove/this

data merge entity @s {DeathLootTable:"minecraft:empty",Silent:1b}
tp @s ~ -1000 ~
kill @s
