# Track revive stat for the player who revived us (nearest alive player)
execute as @p[team=!downed,distance=..4,gamemode=adventure] run scoreboard players add @s stat_revives 1

say Thanks for the revive!
function zbk:player/down_system/events/voice_event_revived
execute as @p[team=!downed,distance=..4,gamemode=adventure] run function zbk:player/down_system/events/voice_event_revive_other
execute as @a[tag=debug,scores={debug_level=3..}] run tellraw @s [{"text":"[REVIVE] ","color":"aqua"},{"selector":"@s","color":"yellow"},{"text":" was revived!","color":"green"}]
execute as @s run function zbk:player/down_system/lifecycle/reset

function zbk:player/down_system/events/player_revived
