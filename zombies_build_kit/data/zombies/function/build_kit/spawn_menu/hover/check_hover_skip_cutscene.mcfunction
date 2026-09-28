# ===================================
# SPAWN MENU - CHECK HOVER (START NO CUTSCENE)
# ===================================
# Animate or reset based on being_looked_at tag set by unified raycast
# Runs as the Start (No Cutscene) text_display entity

# Animate if being looked at
execute if entity @s[tag=being_looked_at] run function zombies:build_kit/spawn_menu/animation/animate_skip_cutscene

# Reset if not being looked at
execute unless entity @s[tag=being_looked_at] run function zombies:build_kit/spawn_menu/animation/reset_skip_cutscene

# Clean up tag
tag @s remove being_looked_at
