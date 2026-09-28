# ===================================
# SPAWN MENU - CHECK HOVER (START GAME)
# ===================================
# Animate or reset based on being_looked_at tag set by unified raycast
# Runs as the Start Game text_display entity

# Animate if being looked at
execute if entity @s[tag=being_looked_at] run function zbk:build_kit/spawn_menu/animation/animate_start_game

# Reset if not being looked at
execute unless entity @s[tag=being_looked_at] run function zbk:build_kit/spawn_menu/animation/reset_start_game

# Clean up tag
tag @s remove being_looked_at
