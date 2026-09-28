# Spawn one vertical-looking particle column from center with exact symmetric slices.
# Uses storage minecraft:temp: y_center

$execute positioned ~ $(y_center) ~ run function zombies:map_elements/traps/electric/particles/column/flat

scoreboard players set #col_i trap_cost 0
$execute if score #line_half_steps trap_cost matches 0.. positioned ~ $(y_center) ~ positioned ~ ~0.5 ~ run function zombies:map_elements/traps/electric/particles/column/up_half

scoreboard players set #col_i trap_cost 0
$execute if score #line_half_steps trap_cost matches 0.. positioned ~ $(y_center) ~ positioned ~ ~-0.5 ~ run function zombies:map_elements/traps/electric/particles/column/down_half
