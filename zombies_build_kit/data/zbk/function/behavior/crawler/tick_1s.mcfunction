# ===================================
# CRAWLER - TICK 1S
# ===================================
# Remove orphaned displays whose paired crawler_ai mob no longer exists

execute as @e[type=item_display,tag=aj.block_bench_crawler.root] run function zbk:behavior/crawler/check_orphaned
