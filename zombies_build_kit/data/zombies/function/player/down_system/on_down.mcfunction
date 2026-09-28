# Cancel crafting immediately on entering the downed flow.
execute if entity @s[tag=cb_building] run function zombies:map_elements/crafting_bench/build/cancel
# Cancel Death Machine if it was active when the player went down
execute if entity @s[tag=death_machine_active] run function zombies:combat/powerups/death_machine/cleanup

# Track down stat
scoreboard players add @s stat_downs 1

say HELP! I'm Down
function zbk:dispatch/voice_event_downed
execute as @a[tag=debug,scores={debug_level=3..}] run tellraw @s [{"text":"[DOWN] ","color":"red"},{"selector":"@s","color":"yellow"},{"text":" is downed!","color":"red"}]
effect give @s minecraft:instant_health 1 1 true

execute at @s run summon armor_stand ~ ~ ~ {Tags:["downed_body"],Invisible:1b,Marker:1b,NoGravity:1b}
execute store result score @e[type=armor_stand,tag=downed_body,sort=nearest,limit=1] id run scoreboard players get @s id
team join downed @s
# Now apply downed effects
effect give @s slowness 9999 255 true
effect give @s weakness 9999 255 true
effect give @s resistance 9999 5 true

scoreboard players set @s downed_timer 600
scoreboard players set @s revive_timer 0

function zbk:dispatch/player_down

# Solo mode: Check for Quick Revive
# If no Quick Revive in solo mode, trigger game over
execute if score #game_mode game_mode matches 1 if score @s perk_revive matches 0 run function zombies:game/management/trigger_game_over

# Solo mode with Quick Revive: spawn decoys at dog spawners to lure zombies away
execute if score #game_mode game_mode matches 1 if score @s perk_revive matches 1.. at @s run function zombies:player/down_system/spawn_solo_decoys

# Co-op mode: Check if this is the last player alive
# If no other players are alive (not downed), trigger game over
execute if score #game_mode game_mode matches 2 unless entity @a[gamemode=adventure,team=!downed] run function zombies:game/management/trigger_game_over
