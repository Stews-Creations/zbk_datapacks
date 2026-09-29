# ===================================
# BUILD MODE - TOGGLE END CUTSCENE
# ===================================
# Toggles a per-player tag that skips the end game cutscene.
# The rest of the game over sequence (title, combat record, lobby TP) still runs.

# Determine desired state change first
execute if entity @s[tag=skip_end_cutscene] run tag @s add end_cutscene_enable
execute unless entity @s[tag=skip_end_cutscene] run tag @s add end_cutscene_disable

# Apply state change
execute if entity @s[tag=end_cutscene_enable] run tag @s remove skip_end_cutscene
execute if entity @s[tag=end_cutscene_disable] run tag @s add skip_end_cutscene

# Feedback
execute if entity @s[tag=end_cutscene_enable] run tellraw @s [{"text":"[Build Mode] ","color":"gold"},{"text":"End game cutscene enabled.","color":"green"}]
execute if entity @s[tag=end_cutscene_disable] run tellraw @s [{"text":"[Build Mode] ","color":"gold"},{"text":"End game cutscene disabled.","color":"yellow"}]

# Cleanup
tag @s remove end_cutscene_enable
tag @s remove end_cutscene_disable
