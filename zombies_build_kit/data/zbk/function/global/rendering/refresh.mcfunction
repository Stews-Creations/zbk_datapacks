# Explicit refresh also reconciles operator edits on currently loaded displays.
execute in minecraft:overworld run tag @e[distance=0..,tag=zbk_range_checked] remove zbk_range_checked
execute in minecraft:the_nether run tag @e[distance=0..,tag=zbk_range_checked] remove zbk_range_checked
execute in minecraft:the_end run tag @e[distance=0..,tag=zbk_range_checked] remove zbk_range_checked
function zbk:global/rendering/maintenance
