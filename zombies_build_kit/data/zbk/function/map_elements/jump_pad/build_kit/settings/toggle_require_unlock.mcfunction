# === TOGGLE REQUIRE UNLOCK ===
# Toggles whether players must reach the end marker before using this jump pad

# If not linked (no start marker resolved), warn and bail
execute unless entity @e[tag=jp_dialog_target,limit=1] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Warning: This marker is not linked! Assign a Link ID to connect it to a Start marker.","color":"red"}]
execute unless entity @e[tag=jp_dialog_target,limit=1] run return fail

# Read current value
scoreboard players set #require_unlock global 1
execute store result score #require_unlock global run data get entity @e[tag=jp_dialog_target,limit=1] data.require_unlock

# Toggle: 1 -> 0 (disable unlock requirement)
execute if score #require_unlock global matches 1.. run data modify entity @e[tag=jp_dialog_target,limit=1] data.require_unlock set value 0
execute if score #require_unlock global matches 1.. as @e[tag=jp_dialog_target,limit=1] run tag @s remove jp_locked
# Light lamps at start and linked end marker
execute if score #require_unlock global matches 1.. as @e[tag=jp_dialog_target,limit=1] at @s run function zbk:map_elements/jump_pad/unlocking/light_lamps
execute if score #require_unlock global matches 1.. as @e[tag=jp_dialog_target,limit=1] store result score #resolve_jp_id global run scoreboard players get @s jump_pad_id
execute if score #require_unlock global matches 1.. as @e[type=marker,tag=jp_end] if score @s jump_pad_id = #resolve_jp_id global if score #resolve_jp_id global matches 1.. at @s run function zbk:map_elements/jump_pad/unlocking/light_lamps
execute if score #require_unlock global matches 1.. run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Require Unlock: ","color":"green"},{"text":"Disabled","color":"red","bold":true},{"text":" - Players can use this jump pad without reaching the end first","color":"green"}]
execute if score #require_unlock global matches 1.. run return 1

# Toggle: 0 -> 1 (enable unlock requirement)
execute if score #require_unlock global matches ..0 run data modify entity @e[tag=jp_dialog_target,limit=1] data.require_unlock set value 1
execute if score #require_unlock global matches ..0 as @e[tag=jp_dialog_target,limit=1] run tag @s add jp_locked
# Unlight lamps at start and linked end marker
execute if score #require_unlock global matches ..0 as @e[tag=jp_dialog_target,limit=1] at @s run function zbk:map_elements/jump_pad/unlocking/unlight_lamps
execute if score #require_unlock global matches ..0 as @e[tag=jp_dialog_target,limit=1] store result score #resolve_jp_id global run scoreboard players get @s jump_pad_id
execute if score #require_unlock global matches ..0 as @e[type=marker,tag=jp_end] if score @s jump_pad_id = #resolve_jp_id global if score #resolve_jp_id global matches 1.. at @s run function zbk:map_elements/jump_pad/unlocking/unlight_lamps
execute if score #require_unlock global matches ..0 run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Require Unlock: ","color":"green"},{"text":"Enabled","color":"yellow","bold":true},{"text":" - Players must reach the end marker first","color":"green"}]

# Reopen the dialog to keep it open
function zbk:map_elements/jump_pad/build_kit/dialogs/open_config_dialog_refresh
