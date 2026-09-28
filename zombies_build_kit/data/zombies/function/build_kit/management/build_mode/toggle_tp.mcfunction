# ===================================
# BUILD MODE - TOGGLE TP
# ===================================
# Toggles a per-player tag that disables ALL teleports for that player.

# Determine desired state change first
execute if entity @s[tag=disable_tp] run tag @s add tp_enable
execute unless entity @s[tag=disable_tp] run tag @s add tp_disable

# Apply state change
execute if entity @s[tag=tp_enable] run tag @s remove disable_tp
execute if entity @s[tag=tp_disable] run tag @s add disable_tp

# Feedback
execute if entity @s[tag=tp_enable] run tellraw @s [{"text":"[Build Mode] ","color":"gold"},{"text":"Teleports enabled.","color":"green"}]
execute if entity @s[tag=tp_disable] run tellraw @s [{"text":"[Build Mode] ","color":"gold"},{"text":"Teleports disabled.","color":"yellow"}]

# Cleanup
tag @s remove tp_enable
tag @s remove tp_disable
