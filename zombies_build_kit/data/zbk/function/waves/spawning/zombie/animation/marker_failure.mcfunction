# Runs as the source marker; two consecutive failures trigger temporary exclusion.
scoreboard players add @s wz_failures 1
execute if score @s wz_failures >= #failure_limit wz_cfg store result score @s wz_blocked run time query gametime
execute if score @s wz_failures >= #failure_limit wz_cfg run scoreboard players operation @s wz_blocked += #failure_ticks wz_cfg
tellraw @a[tag=debug,scores={debug_level=3..}] [{"text":"[WAVE] Zombie creation or animation failed at marker "},{"nbt":"Pos","entity":"@s"},{"text":" reason "},{"score":{"name":"#failure_reason","objective":"wz_state"}},{"text":" failures "},{"score":{"name":"@s","objective":"wz_failures"}}]
