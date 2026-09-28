# Validate if buy animation can be played
# Buy can only play when:
# 1. Box is active AND ready to buy
# 2. Box is ready to buy AND fire sale is active

# Check if location is ready to buy
execute unless score @s mystery_box_ready matches 1 run return 0

# Check conditions:
# Condition 1: Box is active AND ready
execute if score @s mystery_box_active matches 1 run return 1

# Condition 2: Ready AND fire sale is active
execute if score global fire_sale matches 1 run return 1

# If neither condition is met, fail validation
return 0
