function zombies:waves/management/zombie/reset_burst
scoreboard players set #cursor wz_state 0
scoreboard players reset @a wz_sector
scoreboard players reset @e[type=marker,tag=zombie_spawner] wz_recent
scoreboard players reset @e[type=marker,tag=zombie_spawner] wz_blocked
scoreboard players reset @e[type=marker,tag=zombie_spawner] wz_failures
tag @e[type=marker,tag=wz_invalid_reported] remove wz_invalid_reported
