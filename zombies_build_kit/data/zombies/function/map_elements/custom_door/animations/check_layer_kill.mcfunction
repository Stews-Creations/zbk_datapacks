# === DISPLAY ENTITY LAYER KILL ===
# Runs as block_display or item_display. Kills if Y matches #cd_layer_y.
# Called from: animations/up, animations/down
execute store result score #bd_y global run data get entity @s Pos[1]
execute if score #bd_y global = #cd_layer_y global run kill @s
