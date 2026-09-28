# ===================================
# INVENTORY - TICK 1S
# ===================================
# Clean up dropped utility items.
# Kill dropped play test books
execute as @e[type=item] if items entity @s contents minecraft:written_book[custom_data~{play_test_book:true}] run kill @s
# Kill dropped dog round pumpkins
execute as @e[type=item] if items entity @s contents minecraft:carved_pumpkin[custom_model_data~{flags:[true]}] run kill @s
