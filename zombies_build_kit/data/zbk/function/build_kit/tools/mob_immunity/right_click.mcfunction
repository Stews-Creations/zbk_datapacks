# Cycle Mob Immunity Tool mode once per right-click.

execute if score @s mob_immunity_tool_pending matches 1 run scoreboard players set @s mob_immunity_tool_lock 3
execute if score @s mob_immunity_tool_pending matches 1 run advancement revoke @s only zbk:mob_immunity_tool
execute if score @s mob_immunity_tool_pending matches 1 run advancement revoke @s only zbk:mob_immunity_tool_cooldown
execute if score @s mob_immunity_tool_pending matches 1 run return 0

execute if score @s mob_immunity_tool_lock matches 1.. run advancement revoke @s only zbk:mob_immunity_tool
execute if score @s mob_immunity_tool_lock matches 1.. run return 0

scoreboard players add @s mob_immunity_tool_mode 1
scoreboard players set #mob_immunity_tool_modes temp 8
scoreboard players operation @s mob_immunity_tool_mode %= #mob_immunity_tool_modes temp
function zbk:build_kit/tools/mob_immunity/show_mode

scoreboard players set @s mob_immunity_tool_pending 1
scoreboard players set @s mob_immunity_tool_lock 3
advancement revoke @s only zbk:mob_immunity_tool
advancement revoke @s only zbk:mob_immunity_tool_cooldown
