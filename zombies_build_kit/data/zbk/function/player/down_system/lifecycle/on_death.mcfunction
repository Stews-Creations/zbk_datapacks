execute if entity @s[tag=death_machine_active] run function zbk:combat/powerups/death_machine/cleanup
say I bled out, good luck!
execute as @a[tag=debug,scores={debug_level=3..}] run tellraw @s [{"text":"[DEATH] ","color":"red"},{"selector":"@s","color":"yellow"},{"text":" bled out!","color":"red"}]
execute as @s run function zbk:player/down_system/lifecycle/reset
gamemode spectator @s
spectate @p[gamemode=adventure, team=!downed]
execute as @s run function zbk:combat/weapons/initialize

function zbk:player/down_system/events/player_eliminated
