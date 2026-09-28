# Keeps right-click mode cycling semi-auto.

execute if score @s mob_immunity_tool_lock matches 1.. run scoreboard players remove @s mob_immunity_tool_lock 1
execute if score @s mob_immunity_tool_pending matches 1 unless score @s mob_immunity_tool_lock matches 1.. run scoreboard players set @s mob_immunity_tool_pending 0

execute if score @s mob_immunity_tool_lock matches 1.. run advancement revoke @s only zombies:mob_immunity_tool_cooldown
execute if score @s mob_immunity_tool_pending matches 1 run advancement revoke @s only zombies:mob_immunity_tool_cooldown
execute unless score @s mob_immunity_tool_pending matches 1 unless score @s mob_immunity_tool_lock matches 1.. run scoreboard players reset @s mob_immunity_tool_lock
